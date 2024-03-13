#!/usr/local/bin/bash

dir_osm=/usr/local/www/gis-lab/data/projects/osmrus
dir_update=$dir_osm/data/updates/
dir_output=/usr/local/www/gis-lab/data/data/osm
dir_osc=$dir_output/osc
try=0
max_try=20

cd $dir_osm

y_day=$(date -v-1d +%Y%m%d)
n_day=$(date +%Y%m%d)
new=$y_day-$n_day.osc.gz
osc=$y_day-$n_day.osc
until wget -P $dir_update -c http://planet.openstreetmap.org/daily/$new
do
     try=$(($try+1))
     #echo `date` "Try: $try"
     [ $try -gt $max_try ] && break
     sleep 600
done

echo $new `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` >> osmlog.txt

echo "Updating OSM XML file..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` > status
bin/osmosis/bin/osmosis --read-xml-change file="data/updates/$new" --read-xml file="data/rus.osm" --apply-change --write-xml file="data/rus-new.osm"
echo "OSM XML updated " `date "+TIME: %H-%M-%S"` >> osmlog.txt

echo "Clipping back OSM XML file..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` > status
bin/osmosis/bin/osmosis --rx data/rus-new.osm --bp file="poly/russia_full_gen.poly" idTrackerType=BitSet clipIncompleteEntities=true --wx file="data/rus2.osm"
rm data/rus-new.osm
echo "OSM XML clipped back " `date "+TIME: %H-%M-%S"` >> osmlog.txt

echo "Deriving OSM change file..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` > status
bin/osmosis/bin/osmosis --read-xml data/rus2.osm --read-xml data/rus.osm --derive-change --write-xml-change compressionMethod=gzip file=$dir_osc/russia-latest.osc.gz
cp $dir_osc/russia-latest.osc.gz $dir_osc/russia_`date +%Y%m%d`.osc.gz
rm data/rus.osm
mv data/rus2.osm data/rus.osm
echo "OSM change file created " `date "+TIME: %H-%M-%S"` >> osmlog.txt

echo "Compressing Russia OSM XML file..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` > status
bzip2 -k -f -z data/rus.osm
rm data/rus-new.osm
mv data/rus.osm.bz2 $dir_output/rus.osm.bz2
echo "OSM XML for Russia compressed " `date "+TIME: %H-%M-%S"` >> osmlog.txt

echo "Applying diff ..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` > status
./bin/osm2pgsql/osm2pgsql -U pgsql -d osm -p osm -a -s -S bin/osm2pgsql/default.style -l -C 1024 $dir_osc/russia-latest.osc.gz
echo "Diff applied " `date "+TIME: %H-%M-%S"` >> osmlog.txt

echo "VACUUMing database..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` > status
psql -U pgsql -d osm -c "VACUUM ANALYZE"
echo "VACUUMing completed " `date "+TIME: %H-%M-%S"` >> osmlog.txt

psql -U pgsql -d osm -c "UPDATE osm_polygon SET valid=ST_IsValid(osm_polygon.way)"

echo "Creating tables..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"`> status
cd $dir_osm
for i in 1 2 3 4 5 6
do
nohup python views.py $i.lst > /dev/null &
done
psql -U pgsql -d osm -f belarus_full.sql
psql -U pgsql -d osm -f russia_full.sql
echo "Regions tables created " `date "+TIME: %H-%M-%S"` >> osmlog.txt

echo "Generating errors layer..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` > status
cd /usr/local/www/gis-lab/data/projects/osmrus/errors-wms
python gen-osm-errors.py
echo "Error layer updated " `date "+TIME: %H-%M-%S"` >> osmlog.txt

echo "Exporting shapefiles..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"`> status
cd /usr/local/www/gis-lab/data/projects/osmrus
python osm-export-shp.py regions.lst log.txt
echo "Export completed " `date "+TIME: %H-%M-%S"` >> osmlog.txt

echo "Extracting regions..., " `date "+DATE: %Y-%m-%d, TIME: %H-%M-%S"` > status
for i in 1 2 4 5 6
do
nohup python osm-clipper.py $i.lst > /dev/null &
done
python osm-clipper.py 3.lst > /dev/null
echo "OSM XML regions created " `date "+TIME: %H-%M-%S"` >> osmlog.txt
echo "All done" > status
echo "---" >> osmlog.txt
