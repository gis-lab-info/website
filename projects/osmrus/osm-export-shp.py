import ConfigParser
import os
import sys
import time

#Const
db='osm'
user='pgsql'
host='localhost'
confDir='/home/sim/gl/projects/osmrus'
dataDir='/home/sim/gl/data/osm'

#Read file with regions
regions=open(sys.argv[1],'rt').read().split(',')
log=open(sys.argv[2],'wt')

#Extract

#Point layers
config = ConfigParser.RawConfigParser()
config.readfp(open('point.ini'))
if not os.path.isdir(dataDir):
    os.mkdir(dataDir)
os.chdir(dataDir)
for i in regions:
    if not os.path.isdir(i):
        os.mkdir(i)
    os.chdir(i)
    for sect in config.sections():
        os.system('psql -d '+db+' -U '+user+' -h '+host+' -c "Insert INTO osm_stat Values ('+"\'"+i+"\'"+','+"\'"+config.get(sect,'desc')+"\'"','+'(select count(st_intersection) from '+i+config.get(sect,'tableprefix')+'),'+'(select current_date), null,\'FALSE\',(select(current_timestamp::timestamp(0))))"')
        os.system('pgsql2shp -f'+' '+i+config.get(sect,'nameprefix')+'.shp -h '+host+' -u '+user+' '+db+' "SELECT'+' '+config.get(sect,'osmfields')+' from'+ ' '+i+config.get(sect,'tableprefix')+' WHERE '+config.get(sect,'if')+'"')
        os.system('psql -d '+db+' -U '+user+' -h '+host+' -c "UPDATE osm_stat SET extract=(age(localtimestamp(0),starttime::timestamp(0))), flag=\'TRUE\' WHERE (flag=\'FALSE\') and (region=\''+i+'\') and(layer=\''+config.get(sect,'desc')+'\')"')
        if os.path.getsize(i+config.get(sect,'nameprefix')+'.dbf')==1:
            os.remove(i+config.get(sect,'nameprefix')+'.dbf')
        else:
            os.system('7z u -xr!*.7z '+i+config.get(sect,'nameprefix')+'.7z'+' '+i+config.get(sect,'nameprefix')+'.*')
            os.system('7z u -xr!*.7z '+i+'.7z'+' '+i+config.get(sect,'nameprefix')+'.*')
            log.write(time.strftime("%a, %d %b %Y %H:%M:%S")+' '+'%25s%5s'%(i+config.get(sect,'nameprefix'),'   Done\n\n'))
            log.flush()
            os.remove(i+config.get(sect,'nameprefix')+'.shp')
            os.remove(i+config.get(sect,'nameprefix')+'.shx')
            os.remove(i+config.get(sect,'nameprefix')+'.dbf')
            os.remove(i+config.get(sect,'nameprefix')+'.prj')
    os.chdir('../')

#Line layers
os.chdir(confDir)
config = ConfigParser.RawConfigParser()
config.readfp(open('line.ini'))
os.chdir(dataDir)
for i in regions:
    os.chdir(i)
    for sect in config.sections():
        os.system('psql -d '+db+' -U '+user+' -h '+host+' -c "Insert INTO osm_stat Values ('+"\'"+i+"\'"+','+"\'"+config.get(sect,'desc')+"\'"','+'(select count(st_intersection) from '+i+config.get(sect,'tableprefix')+' WHERE '+config.get(sect,'if')+'),(select current_date), null,\'FALSE\',(select(current_timestamp::timestamp(0))))"')
        os.system('pgsql2shp -f'+' '+i+config.get(sect,'nameprefix')+'.shp -h '+host+' -u '+user+' '+db+' "SELECT'+' '+config.get(sect,'osmfields')+' from'+ ' '+i+config.get(sect,'tableprefix')+' WHERE '+config.get(sect,'if')+'"')
        os.system('psql -d '+db+' -U '+user+' -h '+host+' -c "UPDATE osm_stat SET extract=(age(localtimestamp(0),starttime::timestamp(0))), flag=\'TRUE\' WHERE (flag=\'FALSE\') and (region=\''+i+'\') and(layer=\''+config.get(sect,'desc')+'\')"')
        if os.path.getsize(i+config.get(sect,'nameprefix')+'.dbf')==1:
            os.remove(i+config.get(sect,'nameprefix')+'.dbf')
        else:
            os.system('7z u -xr!*.7z '+i+config.get(sect,'nameprefix')+'.7z'+' '+i+config.get(sect,'nameprefix')+'.*')
            os.system('7z u -xr!*.7z '+i+'.7z'+' '+i+config.get(sect,'nameprefix')+'.*')
            log.write(time.strftime("%a, %d %b %Y %H:%M:%S")+' '+'%25s%5s'%(i+config.get(sect,'nameprefix'),'   Done\n\n'))
            log.flush()
            os.remove(i+config.get(sect,'nameprefix')+'.shp')
            os.remove(i+config.get(sect,'nameprefix')+'.shx')
            os.remove(i+config.get(sect,'nameprefix')+'.dbf')
            os.remove(i+config.get(sect,'nameprefix')+'.prj')
    os.chdir('../')

#Poly layers
os.chdir(confDir)
config = ConfigParser.RawConfigParser()
config.readfp(open('poly.ini'))
os.chdir(dataDir)
for i in regions:
    os.chdir(i)
    for sect in config.sections():
        os.system('psql -d '+db+' -U '+user+' -h '+host+' -W -c "Insert INTO osm_stat Values ('+"\'"+i+"\'"+','+"\'"+config.get(sect,'desc')+"\'"','+'(select count(st_intersection) from '+i+config.get(sect,'tableprefix')+' WHERE '+config.get(sect,'if')+'),(select current_date), null,\'FALSE\',(select(current_timestamp::timestamp(0))))"')
        os.system('pgsql2shp -p incognito -f'+' '+i+config.get(sect,'nameprefix')+'.shp -h '+host+' -u '+user+' '+db+' "SELECT'+' '+config.get(sect,'osmfields')+' from'+ ' '+i+config.get(sect,'tableprefix')+' WHERE '+config.get(sect,'if')+'"')
        os.system('psql -W -d '+db+' -U '+user+' -h '+host+' -c "UPDATE osm_stat SET extract=(age(localtimestamp(0),starttime::timestamp(0))), flag=\'TRUE\' WHERE (flag=\'FALSE\') and (region=\''+i+'\') and(layer=\''+config.get(sect,'desc')+'\')"')
        if os.path.getsize(i+config.get(sect,'nameprefix')+'.dbf')==1:
            os.remove(i+config.get(sect,'nameprefix')+'.dbf')
        else:
            os.system('7z u -xr!*.7z '+i+config.get(sect,'nameprefix')+'.7z'+' '+i+config.get(sect,'nameprefix')+'.*')
            os.system('7z u -xr!*.7z '+i+'.7z'+' '+i+config.get(sect,'nameprefix')+'.*')
            log.write(time.strftime("%a, %d %b %Y %H:%M:%S")+' '+'%25s%5s'%(i+config.get(sect,'nameprefix'),'   Done\n\n'))
            log.flush()
            os.remove(i+config.get(sect,'nameprefix')+'.shp')
            os.remove(i+config.get(sect,'nameprefix')+'.shx')
            os.remove(i+config.get(sect,'nameprefix')+'.dbf')
            os.remove(i+config.get(sect,'nameprefix')+'.prj')
    os.chdir('../')
log.close()