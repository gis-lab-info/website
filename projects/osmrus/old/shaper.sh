#!/usr/local/bin/bash

fldr=poly/
osmlog=osmlog.txt

[ $# -lt "1" ] && echo Use: $0 list && exit

echo "Conversion  started:" $1 >> $osmlog
date "+DATE: %Y-%m-%d, TIME: %H:%M:%S" >> $osmlog

for reg in $( cat $1 ); 
do
  outdir=data/regions/$( basename $reg .poly )
  osmfile=$outdir/$( echo $reg | sed 's/poly/osm/' )
date "+Start DATE: %Y-%m-%d, TIME: %H:%M:%S"  
  echo $reg
  echo $outdir
  echo $osmfile
  echo rulset1
  ./osmexport19 ruleset1.oxr $osmfile $outdir
 echo rulset2
  ./osmexport19 ruleset2.oxr $osmfile $outdir
 echo rulset3
  ./osmexport19 ruleset3.oxr $osmfile $outdir
date "+Stop DATE: %Y-%m-%d, TIME: %H:%M:%S"  
done
echo "Conversion finished:" $1 >> $osmlog
date "+DATE: %Y-%m-%d, TIME: %H:%M:%S" >> $osmlog
echo "Conversion finished:" $1
echo "---" >> $osmlog
