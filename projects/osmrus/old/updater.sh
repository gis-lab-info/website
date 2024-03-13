#!/usr/local/bin/bash

cd /usr/local/www/gis-lab/data/projects/osmrus

wget -nc http://planet.openstreetmap.org/daily
new=$(cat index.html |awk '{print $6}' | awk 'BEGIN{FS="\""}{print $3}' |sed 's/>//g'| sed 's/<\/a//g'|sort -n | tail -n 1)
osc=$(echo $new | sed -e "s/.gz//")

cd data/updates/
wget -nc http://planet.openstreetmap.org/daily/$new
gzip -d $new
cd ../../
echo $osc "Change file downloaded" >> osmlog.txt
date "+DATE: %Y-%m-%d, TIME: %H:%M:%S" >> osmlog.txt
../../scripts/osm/osmosis/bin/osmosis --read-xml-change file="data/updates/$osc" --read-xml file="data/rus.osm" --apply-change --write-xml file="data/rus-new.osm"
rm data/rus.osm
mv -f data/rus-new.osm data/rus.osm
rm index.html
echo $osc "Main country file patched" >> osmlog.txt
date "+DATE: %Y-%m-%d, TIME: %H:%M:%S" >> osmlog.txt
echo "---" >> osmlog.txt
