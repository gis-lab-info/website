import os

db='osm'
user='pgsql'
host='localhost'
regions=['orenburg', 'orlovsk', 'penz', 'perm', 'prim', 'pskov', 'rostov', 'ryazan', 'samar', 'saratov', 'yakut', 'sakhalin', 'sverdl',\
'osetiya', 'smol', 'stavrop', 'tambov', 'tver', 'tatar', 'tomsk', 'tul', 'tyva', 'tumen', 'udmurt', 'ulyan', 'khabar', 'khakas', 'khanty',\
'chel', 'chechen', 'chuvash', 'chukot', 'yamal', 'yarosl','mosobl','irkutsk']

j=0
os.chdir('shp_from_osm')

''' Parameters of point layers'''

'''--------------POI---------------------'''
PName='-poi-p'
PFields='st_intersection as geom,amenity,highway,name'
#PCondition=''
'''-------------------------------------------'''


''' Parameters of roads layers'''

'''--------------Roads---------------------'''
RName='-roads-l'
RFields='st_intersection as geom,name,highway,oneway,railway'
#RCondition=''
'''-------------------------------------------'''


''' Parameters of polygon layers'''

'''--------------Boundary---------------------'''
BndName='-boundary-a'
BndFields='st_intersection as geom,name'
BndCondition='boundary<>\'\''
'''-------------------------------------------'''

'''--------------Building---------------------'''
BName='-building-a'
BFields='st_intersection as geom,\\"addr:housenumber\\",amenity,landuse,name'
BCondition='building<>\'\''
'''-------------------------------------------'''

'''-------------Waterway ---------------------'''
WName='-water-a'
WFields='st_intersection as geom,name,\\"natural\\",waterway'
WCondition='waterway<>\'\''
'''-------------------------------------------'''


for i in regions:
    
    if not os.path.isdir(i):
        os.mkdir(i)
    os.chdir(i)
    j=j+1
    
    print (' ************ Start processing of'+' '+i+' '+'region'+' '+'('+str(j)+'/'+str(len(regions))+' ************')
    
    '''------------Export from point layers-------------------'''
    #POI
    print('Processing POI point layer -'+' '+i)
    os.system('pgsql2shp -f'+' '+i+PName+'.shp -h '+host+' -u '+user+' '+db+' "SELECT'+' '+PFields+' from'+ ' '+i+'_point_attr" >>poi.log')
    '''------------end export from point layers----------------'''
    
    '''------------Export from line layers------------------'''    
    #print('Processing line layer -'+' '+i)
    #os.system('pgsql2shp -f'+' '+i+'-l.shp -h localhost -u postgres osm "SELECT * from'+ ' '+i+'_line_attr" >>log.line')
    '''------------end export from line layers--------------'''
    
    '''------------Export from roads layers------------------''' 
    #Roads
    print ('Processing roads layer -'+' '+i)
    os.system('pgsql2shp -f'+' '+i+RName+'.shp -h '+host+' -u '+user+' '+db+' "SELECT'+' '+RFields+' from'+ ' '+i+'_roads_attr" >>roads.log')
    '''------------end export from roads layers--------------'''
    
    '''------------Export from polygon layers------------------'''
    #Boundary
    print ('Processing boundary polygon layer -'+' '+i)
    os.system('pgsql2shp -f'+' '+i+BndName+'.shp -h '+host+' -u '+user+' '+db+' "SELECT'+' '+BndFields+' from'+ ' '+i+'_poly_attr WHERE'+' '+BndCondition+'" >>boundary.log')
    
    #Building
    print ('Processing building polygon layer -'+' '+i)
    os.system('pgsql2shp -f'+' '+i+BName+'.shp -h '+host+' -u '+user+' '+db+' "SELECT'+' '+BFields+' from'+ ' '+i+'_poly_attr WHERE'+' '+BCondition+'" >>building.log')
    
    #Waterway
    print ('Processing waterway polygon layer -'+' '+i)
    os.system('pgsql2shp -f'+' '+i+WName+'.shp -h '+host+' -u '+user+' '+db+' "SELECT'+' '+WFields+' from'+ ' '+i+'_poly_attr WHERE'+' '+WCondition+'" >>water.log')
    '''------------end export from polygon layers--------------'''
    
    print ('FINISHED!')
    os.chdir('../')
