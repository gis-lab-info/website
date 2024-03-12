from datetime import date, timedelta, datetime
import os, time

mainDir='/home/sim/gl/projects/osmrus/'
dataDir=mainDir + 'data'


os.chdir(dataDir)
#donwload planet file
cmd = 'wget http://planet.openstreetmap.org/planet-latest.osm.bz2 -O planet-latest.osm.bz2'
os.system(cmd)
(mode, ino, dev, nlink, uid, gid, size, atime, mtime, ctime) = os.stat('planet-latest.osm.bz2')
dumpctime = (datetime.fromtimestamp(mtime) - timedelta(days=1)).strftime("%y%m%d")
dumpname = 'planet-'+dumpctime+'.osm'
#or 
#import urllib
#f = urllib.urlopen("http://planet.openstreetmap.org/planet-latest.osm.bz2")
#print f.info()
#rename dump
cmd = 'mv planet-latest.osm.bz2 ' + dumpname + '.bz2'
os.system(cmd)

#extract
#cmd = 'bzip2 -d ' + dumpname + '.bz2'
#os.system(cmd)
#clip study area
os.chdir(mainDir)
#cmd = 'bin/osmosis/bin/osmosis --rx data/'+dumpname+' --bp file=poly/_full.poly idTrackerType=BitSet clipIncompleteEntities=true --wx file=data/full-temp1.osm'
cmd = 'bzcat data/'+dumpname+'.bz2 | bin/osmosis/bin/osmosis --rx file=/dev/stdin --bp file=poly/_full.poly idTrackerType=BitSet clipIncompleteEntities=true --wx file=data/full-temp1.osm'
print(cmd)
os.system(cmd)

#calculate how old (number of days) is planet dump
dyear = 2000 + int(dumpname[7:9])
dmonth = int(dumpname[9:11])
dday = int(dumpname[11:13])
#dump day
d = date(dyear, dmonth, dday)
#today
today = date.today()
#number of days
diff = (today-d).days

for i in range(1,diff+1):
    #day + 1
    d1 = d + timedelta(days=1)
    #for example s20100504-20100505.osc.gz
    osc = d.strftime("%Y%m%d") + "-" + d1.strftime("%Y%m%d")+".osc.gz"
    
    #if daily diff doesn't exist, this script might have been ran before diff was created, so skip
    if os.path.exists(dataDir+"/updates/"+osc):
        #update clipped dump with osc file
        cmd = 'bin/osmosis/bin/osmosis --rxc file=data/updates/' + osc + ' --read-xml file=data/full-temp' + str(i) + '.osm --ac --wx file=data/full-temp'+ str(i+1) +'.osm'
        print(cmd)
        os.system(cmd)
        cmd = 'rm data/full-temp' + str(i) + '.osm'
        print(cmd)
        os.system(cmd)
cmd = 'bin/osmosis/bin/osmosis --rx data/full-temp'+ str(i+1) +'.osm --bp file="poly/_full.poly" idTrackerType=BitSet clipIncompleteEntities=true --wx file="data/full-result.osm"'
print(cmd)
os.system(cmd)
cmd = 'rm data/full-temp' + str(i+1) + '.osm'
print(cmd)
os.system(cmd)
