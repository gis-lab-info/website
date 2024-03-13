import re
import os
import sys
import time
from decimal import *

#Const
reslog='/home/sim/gl/projects/osmrus/osmosis-results.log'
dataDir='/home/sim/gl/data/osm'
rusosm='/home/sim/gl/projects/osmrus/data/rus.osm'
polyDir='/home/sim/gl/projects/osmrus/poly'
getcontext().prec = 3

#Read file with regions
regions=open(sys.argv[1],'rt').read().split(',')
osmosislog='/home/sim/gl/projects/osmrus/osmosis.log' + sys.argv[1]
currentregionlog='/home/sim/gl/projects/osmrus/' + sys.argv[1] + '.cur'

result=open(reslog,'wt')
#result.write("region,time\n")
result.close()

os.chdir(dataDir)
for i in regions:
    if not os.path.isdir(i):
        os.mkdir(i)
    print i
    if not i == "russia_full":
        result=open(currentregionlog,'wt')
        result.write(i)
        result.close()
        command = "/home/sim/gl/projects/osmrus/bin/osmosis/bin/osmosis --read-xml file=\""+rusosm+"\" --bounding-polygon file=\"" + polyDir + "/"+ i + ".poly\"" + " clipIncompleteEntities=true --write-xml file=\"" + dataDir +"/" + i + "/" + i +".osm\" > " + osmosislog + " 2>&1"
        print command
        os.system(command)
        for astr in open(osmosislog):
            if re.search('(?<=\d) milliseconds',astr):
                match=re.search('\d+ ',astr)
                result=open(reslog,'a')
                restime = Decimal(match.group()[0:-1])/Decimal(1000*60)
                result.write(i + "," + str(restime) + "\n")
                result.close()
        if os.path.exists(dataDir + "/"+ i + "/" + i + ".osm.bz2"):
            os.system("rm " + dataDir + "/"+ i + "/" + i + ".osm.bz2")
        os.system("bzip2 --best " + dataDir + "/"+ i + "/" + i + ".osm")
        #os.system("7z a " + dataDir + "/"+ i + "/"+ i + "-osm.7z " + dataDir + "/"+ i + "/" + i + ".osm")
        #os.system("rm " + dataDir + "/"+ i + "/" + i + ".osm")
os.system("rm " + osmosislog)
os.system("rm " + currentregionlog)