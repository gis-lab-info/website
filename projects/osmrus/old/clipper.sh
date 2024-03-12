#!/usr/local/bin/bash

fldr=poly/

echo "Clipping started:" >> osmlog.txt
date "+DATE: %Y-%m-%d, TIME: %H:%M:%S" >> osmlog.txt

for i in $( ls $fldr ); 
do
  poly=$i
  reg=$(echo $poly | sed -e "s/.poly//")
  tgt=$(echo $poly | sed -e "s/.poly/.osm/")
  echo $reg
  mkdir data/regions/$reg 
  ./bin/osmosis/bin/osmosis --read-xml file="data/rus.osm" --bounding-polygon file="poly/$poly" --write-xml file="data/regions/$reg/$tgt"
done
echo "Clipping finished:" >> osmlog.txt
date "+DATE: %Y-%m-%d, TIME: %H:%M:%S" >> osmlog.txt
echo "---" >> osmlog.txt
