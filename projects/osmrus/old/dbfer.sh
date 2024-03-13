#!/usr/local/bin/bash

fldr=poly/

for i in $( ls $fldr ); 
do
  poly=$i
  reg=$(echo $poly | sed -e "s/.poly//")
  reg=$(echo $reg | sed -e "s/poly//")
  outdir=data/regions/$reg
  osmfile=$outdir/$(echo $poly | sed -e "s/.poly/.osm/")
  echo $reg
  echo $outdir
  echo $osmfile
  osmexport ruleset1.oxr $osmfile $outdir
  osmexport ruleset2.oxr $osmfile $outdir
  osmexport ruleset3.oxr $osmfile $outdir
  
  cd $outdir
  for i in $( ls *.shp ); 
  do
   filesize=$(ls -la $i | awk '{print $5}')
   fileall=$(echo $i | sed -e "s/shp/*/")
   filedbf=$(echo $i | sed -e "s/shp/dbf/")
   filedbf2=$(echo $i | sed -e "s/shp/dbf2/")
   if [ $filesize = 100 ]
   then
     rm $fileall
	else
	 echo "Encoding "$filedbf
	 python ../../../dbfer.py $filedbf $filedbf2
   fi
  done 
  cd ../../../
done

