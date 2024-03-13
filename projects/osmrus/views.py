import sys
import os

db='osm'
user='pgsql'
host='localhost'
workDir='/home/sim/gl/projects/osmrus'

#Read file with regions
regfile = sys.argv[1]
viewfile = regfile+'_view.sql'
regions=open(regfile,'rt').read().split(',')

os.chdir(workDir)

#for each region, 1. create sql file and 2. execute it with psql
for reg in regions:
    #1. create sql file
    f = open(viewfile,'w')
    #points
    f.write('DROP TABLE IF EXISTS '+reg+'_point_attr;\n')
    f.write('DROP TABLE IF EXISTS '+reg+'_line_attr;\n')
    f.write('DROP TABLE IF EXISTS '+reg+'_roads_attr;\n')
    f.write('DROP TABLE IF EXISTS '+reg+'_poly_attr;\n\n')

    f.write('CREATE TABLE '+reg+'_point_attr AS\n')
    f.write('SELECT \n')
    f.write('ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound\n')
    f.write('WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.reg=\''+reg+'\');\n')
    f.write('ALTER TABLE '+reg+'_point_attr DROP COLUMN way;\n\n')
      
    #lines
    f.write('CREATE TABLE '+reg+'_line_attr AS\n')
    f.write('SELECT \n')
    f.write('ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound\n')
    f.write('WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.reg=\''+reg+'\');\n')
    f.write('ALTER TABLE '+reg+'_line_attr DROP COLUMN way;\n\n')
      
    #roads
    f.write('CREATE TABLE '+reg+'_roads_attr AS\n')
    f.write('SELECT \n')
    f.write('ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound\n')
    f.write('WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.reg=\''+reg+'\');\n')
    f.write('ALTER TABLE '+reg+'_roads_attr DROP COLUMN way;\n\n')
      
    #polygons
    f.write('CREATE TABLE '+reg+'_poly_attr AS\n')
    f.write('SELECT \n')
    f.write('ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound\n')
    f.write('WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid=\'true\') AND (russia_bound.reg=\''+reg+'\')\n\n')

    f.write('UNION\n\n')

    f.write('SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound\n')
    f.write('WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid=\'false\') AND (russia_bound.reg=\''+reg+'\');\n')
    f.write('ALTER TABLE '+reg+'_poly_attr DROP COLUMN way;\n')
    
    f.close()
    
    #2. execute it with psql
    os.system('psql -d '+db+' -U '+user+' -h '+host+' -f ' + viewfile)
    #3. clean up the file
    os.system('rm ' + viewfile)