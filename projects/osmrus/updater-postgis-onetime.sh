#!/usr/local/bin/bash

cd /usr/local/www/gis-lab/data/projects/osmrus/data

wget http://planet.openstreetmap.org/planet-latest.osm.bz2
bzip2 -d *.bz2

cd ..

pg_dump -U pgsql --inserts -f osm_stat.sql -t osm_stat osm

dropdb -U pgsql -W osm
createdb -U pgsql -E utf8 osm
createlang -U pgsql plpgsql osm

psql -U pgsql -d osm -f /usr/local/share/postgis/contrib/postgis.sql
psql -U pgsql -d osm -f /usr/local/share/postgis/contrib/spatial_ref_sys.sql
psql -U pgsql -d osm -f /usr/local/share/postgresql/contrib/_int.sql

./bin/osm2pgsql/osm2pgsql -U pgsql -d osm -p osm -l -s -S bin/osm2pgsql/default.style -C 1024 data/rus.osm
psql -U pgsql -d osm -c "VACUUM ANALYZE"
psql -U pgsql -d osm -c "ALTER table osm_polygon ADD valid boolean"
psql -U pgsql -d osm -c "UPDATE osm_polygon SET valid=ST_IsValid(osm_polygon.way)"
psql -U pgsql -f ~/gl/data/vmap0/bnd-a-osm.sql -d osm
psql -U pgsql -f ~/gl/data/vmap0/bnd-a-osm-full.sql -d osm
psql -U pgsql -f ~/gl/data/vmap0/bnd-a-belarus-osm.sql -d osm
psql -U pgsql -d osm -c "CREATE INDEX "russia_bound_index" ON "russia_bound" USING GIST (the_geom)"
#psql -U pgsql -d osm -c "CREATE INDEX "belarus_bound_index" ON "belarus_bound" USING GIST (the_geom)"
psql -U pgsql -d osm -c "CREATE INDEX "belarus_bound_full_index" ON "belarus_bound_full" USING GIST (the_geom)"

for i in 1 2 4 5 6
do
nohup python views.py $i.lst > /dev/null &
done
python views.py 3.lst > /dev/null 
psql -U pgsql -f belarus_full.sql -d osm


cd /usr/local/www/gis-lab/data/projects/osmrus/errors-wms
python gen-osm-errors.py

cd /usr/local/www/gis-lab/data/projects/osmrus
psql -U pgsql -d osm -f osm_stat.sql
rm osm_stat.sql