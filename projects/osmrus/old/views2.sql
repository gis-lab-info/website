--Республика Марий Эл (точки)
DROP TABLE IF EXISTS mariyel_point_attr;
DROP TABLE IF EXISTS mariyel_line_attr;
DROP TABLE IF EXISTS mariyel_roads_attr;
DROP TABLE IF EXISTS mariyel_poly_attr;

CREATE TABLE mariyel_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Марий Эл');
ALTER TABLE mariyel_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE mariyel_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Марий Эл');
ALTER TABLE mariyel_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE mariyel_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Марий Эл');
ALTER TABLE mariyel_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE mariyel_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Марий Эл')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Марий Эл');
ALTER TABLE mariyel_poly_attr DROP COLUMN way;
  
--Московская область (точки)
DROP TABLE IF EXISTS mosobl_point_attr;
DROP TABLE IF EXISTS mosobl_line_attr;
DROP TABLE IF EXISTS mosobl_roads_attr;
DROP TABLE IF EXISTS mosobl_poly_attr;

CREATE TABLE mosobl_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Московская область');
ALTER TABLE mosobl_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE mosobl_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Московская область');
ALTER TABLE mosobl_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE mosobl_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Московская область');
ALTER TABLE mosobl_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE mosobl_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Московская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Московская область');
ALTER TABLE mosobl_poly_attr DROP COLUMN way;
  
--Республика Мордовия (точки)
DROP TABLE IF EXISTS mordov_point_attr;
DROP TABLE IF EXISTS mordov_line_attr;
DROP TABLE IF EXISTS mordov_roads_attr;
DROP TABLE IF EXISTS mordov_poly_attr;

CREATE TABLE mordov_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Мордовия');
ALTER TABLE mordov_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE mordov_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Мордовия');
ALTER TABLE mordov_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE mordov_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Мордовия');
ALTER TABLE mordov_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE mordov_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Мордовия')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Мордовия');
ALTER TABLE mordov_poly_attr DROP COLUMN way;
  
--Мурманская область (точки)
DROP TABLE IF EXISTS murmansk_point_attr;
DROP TABLE IF EXISTS murmansk_line_attr;
DROP TABLE IF EXISTS murmansk_roads_attr;
DROP TABLE IF EXISTS murmansk_poly_attr;

CREATE TABLE murmansk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Мурманская область');
ALTER TABLE murmansk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE murmansk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Мурманская область');
ALTER TABLE murmansk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE murmansk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Мурманская область');
ALTER TABLE murmansk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE murmansk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Мурманская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Мурманская область');
ALTER TABLE murmansk_poly_attr DROP COLUMN way;
  
--Ненецкий автономный округ (точки)
DROP TABLE IF EXISTS nenec_point_attr;
DROP TABLE IF EXISTS nenec_line_attr;
DROP TABLE IF EXISTS nenec_roads_attr;
DROP TABLE IF EXISTS nenec_poly_attr;

CREATE TABLE nenec_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ненецкий автономный округ');
ALTER TABLE nenec_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE nenec_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ненецкий автономный округ');
ALTER TABLE nenec_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE nenec_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ненецкий автономный округ');
ALTER TABLE nenec_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE nenec_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ненецкий автономный округ')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ненецкий автономный округ');
ALTER TABLE nenec_poly_attr DROP COLUMN way;
  
--Нижегородская область (точки)
DROP TABLE IF EXISTS nizhegorod_point_attr;
DROP TABLE IF EXISTS nizhegorod_line_attr;
DROP TABLE IF EXISTS nizhegorod_roads_attr;
DROP TABLE IF EXISTS nizhegorod_poly_attr;

CREATE TABLE nizhegorod_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Нижегородская область');
ALTER TABLE nizhegorod_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE nizhegorod_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Нижегородская область');
ALTER TABLE nizhegorod_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE nizhegorod_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Нижегородская область');
ALTER TABLE nizhegorod_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE nizhegorod_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Нижегородская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Нижегородская область');
ALTER TABLE nizhegorod_poly_attr DROP COLUMN way;
  
--Новгородская область (точки)
DROP TABLE IF EXISTS novgorod_point_attr;
DROP TABLE IF EXISTS novgorod_line_attr;
DROP TABLE IF EXISTS novgorod_roads_attr;
DROP TABLE IF EXISTS novgorod_poly_attr;

CREATE TABLE novgorod_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Новгородская область');
ALTER TABLE novgorod_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE novgorod_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Новгородская область');
ALTER TABLE novgorod_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE novgorod_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Новгородская область');
ALTER TABLE novgorod_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE novgorod_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Новгородская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Новгородская область');
ALTER TABLE novgorod_poly_attr DROP COLUMN way;
  
--Новосибирская область (точки)
DROP TABLE IF EXISTS novosib_point_attr;
DROP TABLE IF EXISTS novosib_line_attr;
DROP TABLE IF EXISTS novosib_roads_attr;
DROP TABLE IF EXISTS novosib_poly_attr;

CREATE TABLE novosib_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Новосибирская область');
ALTER TABLE novosib_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE novosib_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Новосибирская область');
ALTER TABLE novosib_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE novosib_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Новосибирская область');
ALTER TABLE novosib_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE novosib_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Новосибирская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Новосибирская область');
ALTER TABLE novosib_poly_attr DROP COLUMN way;
  
--Омская область (точки)
DROP TABLE IF EXISTS omsk_point_attr;
DROP TABLE IF EXISTS omsk_line_attr;
DROP TABLE IF EXISTS omsk_roads_attr;
DROP TABLE IF EXISTS omsk_poly_attr;

CREATE TABLE omsk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Омская область');
ALTER TABLE omsk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE omsk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Омская область');
ALTER TABLE omsk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE omsk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Омская область');
ALTER TABLE omsk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE omsk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Омская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Омская область');
ALTER TABLE omsk_poly_attr DROP COLUMN way;
  
--Оренбургская область (точки)
DROP TABLE IF EXISTS orenburg_point_attr;
DROP TABLE IF EXISTS orenburg_line_attr;
DROP TABLE IF EXISTS orenburg_roads_attr;
DROP TABLE IF EXISTS orenburg_poly_attr;

CREATE TABLE orenburg_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Оренбургская область');
ALTER TABLE orenburg_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE orenburg_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Оренбургская область');
ALTER TABLE orenburg_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE orenburg_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Оренбургская область');
ALTER TABLE orenburg_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE orenburg_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Оренбургская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Оренбургская область');
ALTER TABLE orenburg_poly_attr DROP COLUMN way;
  
--Орловская область (точки)
DROP TABLE IF EXISTS orlovsk_point_attr;
DROP TABLE IF EXISTS orlovsk_line_attr;
DROP TABLE IF EXISTS orlovsk_roads_attr;
DROP TABLE IF EXISTS orlovsk_poly_attr;

CREATE TABLE orlovsk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Орловская область');
ALTER TABLE orlovsk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE orlovsk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Орловская область');
ALTER TABLE orlovsk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE orlovsk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Орловская область');
ALTER TABLE orlovsk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE orlovsk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Орловская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Орловская область');
ALTER TABLE orlovsk_poly_attr DROP COLUMN way;
  
--Пензенская область (точки)
DROP TABLE IF EXISTS penz_point_attr;
DROP TABLE IF EXISTS penz_line_attr;
DROP TABLE IF EXISTS penz_roads_attr;
DROP TABLE IF EXISTS penz_poly_attr;

CREATE TABLE penz_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Пензенская область');
ALTER TABLE penz_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE penz_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Пензенская область');
ALTER TABLE penz_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE penz_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Пензенская область');
ALTER TABLE penz_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE penz_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Пензенская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Пензенская область');
ALTER TABLE penz_poly_attr DROP COLUMN way;
  
--Пермский край (точки)
DROP TABLE IF EXISTS perm_point_attr;
DROP TABLE IF EXISTS perm_line_attr;
DROP TABLE IF EXISTS perm_roads_attr;
DROP TABLE IF EXISTS perm_poly_attr;

CREATE TABLE perm_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Пермский край');
ALTER TABLE perm_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE perm_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Пермский край');
ALTER TABLE perm_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE perm_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Пермский край');
ALTER TABLE perm_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE perm_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Пермский край')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Пермский край');
ALTER TABLE perm_poly_attr DROP COLUMN way;
  
--Приморский край (точки)
DROP TABLE IF EXISTS prim_point_attr;
DROP TABLE IF EXISTS prim_line_attr;
DROP TABLE IF EXISTS prim_roads_attr;
DROP TABLE IF EXISTS prim_poly_attr;

CREATE TABLE prim_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Приморский край');
ALTER TABLE prim_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE prim_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Приморский край');
ALTER TABLE prim_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE prim_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Приморский край');
ALTER TABLE prim_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE prim_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Приморский край')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Приморский край');
ALTER TABLE prim_poly_attr DROP COLUMN way;
  
--Псковская область (точки)
DROP TABLE IF EXISTS pskov_point_attr;
DROP TABLE IF EXISTS pskov_line_attr;
DROP TABLE IF EXISTS pskov_roads_attr;
DROP TABLE IF EXISTS pskov_poly_attr;

CREATE TABLE pskov_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Псковская область');
ALTER TABLE pskov_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE pskov_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Псковская область');
ALTER TABLE pskov_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE pskov_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Псковская область');
ALTER TABLE pskov_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE pskov_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Псковская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Псковская область');
ALTER TABLE pskov_poly_attr DROP COLUMN way;
  
--Ростовская область (точки)
DROP TABLE IF EXISTS rostov_point_attr;
DROP TABLE IF EXISTS rostov_line_attr;
DROP TABLE IF EXISTS rostov_roads_attr;
DROP TABLE IF EXISTS rostov_poly_attr;

CREATE TABLE rostov_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ростовская область');
ALTER TABLE rostov_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE rostov_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ростовская область');
ALTER TABLE rostov_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE rostov_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ростовская область');
ALTER TABLE rostov_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE rostov_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ростовская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ростовская область');
ALTER TABLE rostov_poly_attr DROP COLUMN way;
  
--Рязанская область (точки)
DROP TABLE IF EXISTS ryazan_point_attr;
DROP TABLE IF EXISTS ryazan_line_attr;
DROP TABLE IF EXISTS ryazan_roads_attr;
DROP TABLE IF EXISTS ryazan_poly_attr;

CREATE TABLE ryazan_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Рязанская область');
ALTER TABLE ryazan_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE ryazan_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Рязанская область');
ALTER TABLE ryazan_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE ryazan_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Рязанская область');
ALTER TABLE ryazan_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE ryazan_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Рязанская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Рязанская область');
ALTER TABLE ryazan_poly_attr DROP COLUMN way;
  
--Самарская область (точки)
DROP TABLE IF EXISTS samar_point_attr;
DROP TABLE IF EXISTS samar_line_attr;
DROP TABLE IF EXISTS samar_roads_attr;
DROP TABLE IF EXISTS samar_poly_attr;

CREATE TABLE samar_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Самарская область');
ALTER TABLE samar_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE samar_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Самарская область');
ALTER TABLE samar_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE samar_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Самарская область');
ALTER TABLE samar_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE samar_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Самарская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Самарская область');
ALTER TABLE samar_poly_attr DROP COLUMN way;
  
--Саратовская область (точки)
DROP TABLE IF EXISTS saratov_point_attr;
DROP TABLE IF EXISTS saratov_line_attr;
DROP TABLE IF EXISTS saratov_roads_attr;
DROP TABLE IF EXISTS saratov_poly_attr;

CREATE TABLE saratov_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Саратовская область');
ALTER TABLE saratov_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE saratov_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Саратовская область');
ALTER TABLE saratov_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE saratov_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Саратовская область');
ALTER TABLE saratov_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE saratov_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Саратовская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Саратовская область');
ALTER TABLE saratov_poly_attr DROP COLUMN way;
  
--Республика Саха (Якутия) (точки)
DROP TABLE IF EXISTS yakut_point_attr;
DROP TABLE IF EXISTS yakut_line_attr;
DROP TABLE IF EXISTS yakut_roads_attr;
DROP TABLE IF EXISTS yakut_poly_attr;

CREATE TABLE yakut_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Саха (Якутия)');
ALTER TABLE yakut_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE yakut_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Саха (Якутия)');
ALTER TABLE yakut_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE yakut_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Саха (Якутия)');
ALTER TABLE yakut_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE yakut_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Саха (Якутия)')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Саха (Якутия)');
ALTER TABLE yakut_poly_attr DROP COLUMN way;
  
--Сахалинская область (точки)
DROP TABLE IF EXISTS sakhalin_point_attr;
DROP TABLE IF EXISTS sakhalin_line_attr;
DROP TABLE IF EXISTS sakhalin_roads_attr;
DROP TABLE IF EXISTS sakhalin_poly_attr;

CREATE TABLE sakhalin_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Сахалинская область');
ALTER TABLE sakhalin_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE sakhalin_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Сахалинская область');
ALTER TABLE sakhalin_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE sakhalin_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Сахалинская область');
ALTER TABLE sakhalin_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE sakhalin_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Сахалинская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Сахалинская область');
ALTER TABLE sakhalin_poly_attr DROP COLUMN way;
  
--Свердловская область (точки)
DROP TABLE IF EXISTS sverdl_point_attr;
DROP TABLE IF EXISTS sverdl_line_attr;
DROP TABLE IF EXISTS sverdl_roads_attr;
DROP TABLE IF EXISTS sverdl_poly_attr;

CREATE TABLE sverdl_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Свердловская область');
ALTER TABLE sverdl_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE sverdl_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Свердловская область');
ALTER TABLE sverdl_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE sverdl_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Свердловская область');
ALTER TABLE sverdl_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE sverdl_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Свердловская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Свердловская область');
ALTER TABLE sverdl_poly_attr DROP COLUMN way;
  
--Республика Северная Осетия - Алания (точки)
DROP TABLE IF EXISTS osetiya_point_attr;
DROP TABLE IF EXISTS osetiya_line_attr;
DROP TABLE IF EXISTS osetiya_roads_attr;
DROP TABLE IF EXISTS osetiya_poly_attr;

CREATE TABLE osetiya_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Северная Осетия - Алания');
ALTER TABLE osetiya_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE osetiya_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Северная Осетия - Алания');
ALTER TABLE osetiya_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE osetiya_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Северная Осетия - Алания');
ALTER TABLE osetiya_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE osetiya_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Северная Осетия - Алания')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Северная Осетия - Алания');
ALTER TABLE osetiya_poly_attr DROP COLUMN way;
  
--Смоленская область (точки)
DROP TABLE IF EXISTS smol_point_attr;
DROP TABLE IF EXISTS smol_line_attr;
DROP TABLE IF EXISTS smol_roads_attr;
DROP TABLE IF EXISTS smol_poly_attr;

CREATE TABLE smol_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Смоленская область');
ALTER TABLE smol_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE smol_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Смоленская область');
ALTER TABLE smol_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE smol_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Смоленская область');
ALTER TABLE smol_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE smol_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Смоленская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Смоленская область');
ALTER TABLE smol_poly_attr DROP COLUMN way;
  
--Ставропольский край (точки)
DROP TABLE IF EXISTS stavrop_point_attr;
DROP TABLE IF EXISTS stavrop_line_attr;
DROP TABLE IF EXISTS stavrop_roads_attr;
DROP TABLE IF EXISTS stavrop_poly_attr;

CREATE TABLE stavrop_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ставропольский край');
ALTER TABLE stavrop_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE stavrop_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ставропольский край');
ALTER TABLE stavrop_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE stavrop_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ставропольский край');
ALTER TABLE stavrop_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE stavrop_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ставропольский край')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ставропольский край');
ALTER TABLE stavrop_poly_attr DROP COLUMN way;
  
--Тамбовская область (точки)
DROP TABLE IF EXISTS tambov_point_attr;
DROP TABLE IF EXISTS tambov_line_attr;
DROP TABLE IF EXISTS tambov_roads_attr;
DROP TABLE IF EXISTS tambov_poly_attr;

CREATE TABLE tambov_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тамбовская область');
ALTER TABLE tambov_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE tambov_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тамбовская область');
ALTER TABLE tambov_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE tambov_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тамбовская область');
ALTER TABLE tambov_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE tambov_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Тамбовская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Тамбовская область');
ALTER TABLE tambov_poly_attr DROP COLUMN way;
  
--Тверская область (точки)
DROP TABLE IF EXISTS tver_point_attr;
DROP TABLE IF EXISTS tver_line_attr;
DROP TABLE IF EXISTS tver_roads_attr;
DROP TABLE IF EXISTS tver_poly_attr;

CREATE TABLE tver_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тверская область');
ALTER TABLE tver_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE tver_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тверская область');
ALTER TABLE tver_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE tver_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тверская область');
ALTER TABLE tver_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE tver_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Тверская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Тверская область');
ALTER TABLE tver_poly_attr DROP COLUMN way;
  
--Республика Татарстан (Татарстан) (точки)
DROP TABLE IF EXISTS tatar_point_attr;
DROP TABLE IF EXISTS tatar_line_attr;
DROP TABLE IF EXISTS tatar_roads_attr;
DROP TABLE IF EXISTS tatar_poly_attr;

CREATE TABLE tatar_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Татарстан (Татарстан)');
ALTER TABLE tatar_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE tatar_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Татарстан (Татарстан)');
ALTER TABLE tatar_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE tatar_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Татарстан (Татарстан)');
ALTER TABLE tatar_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE tatar_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Татарстан (Татарстан)')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Татарстан (Татарстан)');
ALTER TABLE tatar_poly_attr DROP COLUMN way;
  
--Томская область (точки)
DROP TABLE IF EXISTS tomsk_point_attr;
DROP TABLE IF EXISTS tomsk_line_attr;
DROP TABLE IF EXISTS tomsk_roads_attr;
DROP TABLE IF EXISTS tomsk_poly_attr;

CREATE TABLE tomsk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Томская область');
ALTER TABLE tomsk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE tomsk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Томская область');
ALTER TABLE tomsk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE tomsk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Томская область');
ALTER TABLE tomsk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE tomsk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Томская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Томская область');
ALTER TABLE tomsk_poly_attr DROP COLUMN way;
  
--Тульская область (точки)
DROP TABLE IF EXISTS tul_point_attr;
DROP TABLE IF EXISTS tul_line_attr;
DROP TABLE IF EXISTS tul_roads_attr;
DROP TABLE IF EXISTS tul_poly_attr;

CREATE TABLE tul_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тульская область');
ALTER TABLE tul_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE tul_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тульская область');
ALTER TABLE tul_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE tul_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тульская область');
ALTER TABLE tul_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE tul_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Тульская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Тульская область');
ALTER TABLE tul_poly_attr DROP COLUMN way;
  
--Республика Тыва (точки)
DROP TABLE IF EXISTS tyva_point_attr;
DROP TABLE IF EXISTS tyva_line_attr;
DROP TABLE IF EXISTS tyva_roads_attr;
DROP TABLE IF EXISTS tyva_poly_attr;

CREATE TABLE tyva_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Тыва');
ALTER TABLE tyva_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE tyva_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Тыва');
ALTER TABLE tyva_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE tyva_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Тыва');
ALTER TABLE tyva_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE tyva_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Тыва')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Тыва');
ALTER TABLE tyva_poly_attr DROP COLUMN way;
  
--Тюменская область (точки)
DROP TABLE IF EXISTS tumen_point_attr;
DROP TABLE IF EXISTS tumen_line_attr;
DROP TABLE IF EXISTS tumen_roads_attr;
DROP TABLE IF EXISTS tumen_poly_attr;

CREATE TABLE tumen_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тюменская область');
ALTER TABLE tumen_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE tumen_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тюменская область');
ALTER TABLE tumen_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE tumen_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Тюменская область');
ALTER TABLE tumen_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE tumen_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Тюменская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Тюменская область');
ALTER TABLE tumen_poly_attr DROP COLUMN way;
  
--Удмуртская Республика (точки)
DROP TABLE IF EXISTS udmurt_point_attr;
DROP TABLE IF EXISTS udmurt_line_attr;
DROP TABLE IF EXISTS udmurt_roads_attr;
DROP TABLE IF EXISTS udmurt_poly_attr;

CREATE TABLE udmurt_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Удмуртская Республика');
ALTER TABLE udmurt_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE udmurt_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Удмуртская Республика');
ALTER TABLE udmurt_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE udmurt_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Удмуртская Республика');
ALTER TABLE udmurt_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE udmurt_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Удмуртская Республика')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Удмуртская Республика');
ALTER TABLE udmurt_poly_attr DROP COLUMN way;
  
--Ульяновская область (точки)
DROP TABLE IF EXISTS ulyan_point_attr;
DROP TABLE IF EXISTS ulyan_line_attr;
DROP TABLE IF EXISTS ulyan_roads_attr;
DROP TABLE IF EXISTS ulyan_poly_attr;

CREATE TABLE ulyan_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ульяновская область');
ALTER TABLE ulyan_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE ulyan_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ульяновская область');
ALTER TABLE ulyan_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE ulyan_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ульяновская область');
ALTER TABLE ulyan_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE ulyan_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ульяновская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ульяновская область');
ALTER TABLE ulyan_poly_attr DROP COLUMN way;
  
--Хабаровский край (точки)
DROP TABLE IF EXISTS khabar_point_attr;
DROP TABLE IF EXISTS khabar_line_attr;
DROP TABLE IF EXISTS khabar_roads_attr;
DROP TABLE IF EXISTS khabar_poly_attr;

CREATE TABLE khabar_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Хабаровский край');
ALTER TABLE khabar_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE khabar_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Хабаровский край');
ALTER TABLE khabar_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE khabar_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Хабаровский край');
ALTER TABLE khabar_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE khabar_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Хабаровский край')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Хабаровский край');
ALTER TABLE khabar_poly_attr DROP COLUMN way;
  
--Республика Хакасия (точки)
DROP TABLE IF EXISTS khakas_point_attr;
DROP TABLE IF EXISTS khakas_line_attr;
DROP TABLE IF EXISTS khakas_roads_attr;
DROP TABLE IF EXISTS khakas_poly_attr;

CREATE TABLE khakas_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Хакасия');
ALTER TABLE khakas_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE khakas_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Хакасия');
ALTER TABLE khakas_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE khakas_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Хакасия');
ALTER TABLE khakas_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE khakas_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Хакасия')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Хакасия');
ALTER TABLE khakas_poly_attr DROP COLUMN way;
  
--Ханты-Мансийский автономный округ (точки)
DROP TABLE IF EXISTS khanty_point_attr;
DROP TABLE IF EXISTS khanty_line_attr;
DROP TABLE IF EXISTS khanty_roads_attr;
DROP TABLE IF EXISTS khanty_poly_attr;

CREATE TABLE khanty_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ханты-Мансийский автономный округ');
ALTER TABLE khanty_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE khanty_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ханты-Мансийский автономный округ');
ALTER TABLE khanty_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE khanty_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ханты-Мансийский автономный округ');
ALTER TABLE khanty_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE khanty_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ханты-Мансийский автономный округ')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ханты-Мансийский автономный округ');
ALTER TABLE khanty_poly_attr DROP COLUMN way;
  
--Челябинская область (точки)
DROP TABLE IF EXISTS chel_point_attr;
DROP TABLE IF EXISTS chel_line_attr;
DROP TABLE IF EXISTS chel_roads_attr;
DROP TABLE IF EXISTS chel_poly_attr;

CREATE TABLE chel_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Челябинская область');
ALTER TABLE chel_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE chel_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Челябинская область');
ALTER TABLE chel_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE chel_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Челябинская область');
ALTER TABLE chel_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE chel_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Челябинская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Челябинская область');
ALTER TABLE chel_poly_attr DROP COLUMN way;
  
--Чеченская Республика (точки)
DROP TABLE IF EXISTS chechen_point_attr;
DROP TABLE IF EXISTS chechen_line_attr;
DROP TABLE IF EXISTS chechen_roads_attr;
DROP TABLE IF EXISTS chechen_poly_attr;

CREATE TABLE chechen_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чеченская Республика');
ALTER TABLE chechen_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE chechen_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чеченская Республика');
ALTER TABLE chechen_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE chechen_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чеченская Республика');
ALTER TABLE chechen_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE chechen_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Чеченская Республика')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Чеченская Республика');
ALTER TABLE chechen_poly_attr DROP COLUMN way;
  
--Чувашская Республика (точки)
DROP TABLE IF EXISTS chuvash_point_attr;
DROP TABLE IF EXISTS chuvash_line_attr;
DROP TABLE IF EXISTS chuvash_roads_attr;
DROP TABLE IF EXISTS chuvash_poly_attr;

CREATE TABLE chuvash_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чувашская Республика');
ALTER TABLE chuvash_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE chuvash_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чувашская Республика');
ALTER TABLE chuvash_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE chuvash_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чувашская Республика');
ALTER TABLE chuvash_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE chuvash_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Чувашская Республика')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Чувашская Республика');
ALTER TABLE chuvash_poly_attr DROP COLUMN way;
  
--Чукотский автономный округ (точки)
DROP TABLE IF EXISTS chukot_point_attr;
DROP TABLE IF EXISTS chukot_line_attr;
DROP TABLE IF EXISTS chukot_roads_attr;
DROP TABLE IF EXISTS chukot_poly_attr;

CREATE TABLE chukot_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чукотский автономный округ');
ALTER TABLE chukot_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE chukot_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чукотский автономный округ');
ALTER TABLE chukot_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE chukot_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Чукотский автономный округ');
ALTER TABLE chukot_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE chukot_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Чукотский автономный округ')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Чукотский автономный округ');
ALTER TABLE chukot_poly_attr DROP COLUMN way;
  
--Ямало-Ненецкий автономный округ (точки)
DROP TABLE IF EXISTS yamal_point_attr;
DROP TABLE IF EXISTS yamal_line_attr;
DROP TABLE IF EXISTS yamal_roads_attr;
DROP TABLE IF EXISTS yamal_poly_attr;

CREATE TABLE yamal_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ямало-Ненецкий автономный округ');
ALTER TABLE yamal_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE yamal_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ямало-Ненецкий автономный округ');
ALTER TABLE yamal_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE yamal_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ямало-Ненецкий автономный округ');
ALTER TABLE yamal_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE yamal_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ямало-Ненецкий автономный округ')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ямало-Ненецкий автономный округ');
ALTER TABLE yamal_poly_attr DROP COLUMN way;
  
--Ярославская область (точки)
DROP TABLE IF EXISTS yarosl_point_attr;
DROP TABLE IF EXISTS yarosl_line_attr;
DROP TABLE IF EXISTS yarosl_roads_attr;
DROP TABLE IF EXISTS yarosl_poly_attr;

CREATE TABLE yarosl_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ярославская область');
ALTER TABLE yarosl_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE yarosl_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ярославская область');
ALTER TABLE yarosl_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE yarosl_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ярославская область');
ALTER TABLE yarosl_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE yarosl_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ярославская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ярославская область');
ALTER TABLE yarosl_poly_attr DROP COLUMN way;

--Россия (точки)
DROP TABLE IF EXISTS russia_full_point_attr;
DROP TABLE IF EXISTS russia_full_line_attr;
DROP TABLE IF EXISTS russia_full_roads_attr;
DROP TABLE IF EXISTS russia_full_poly_attr;

CREATE TABLE russia_full_point_attr AS
SELECT 
ST_Intersection(osm_point.way,ST_GeomFromText('POLYGON((26.8 41.8,26.8 82.2,180 82.2,180 41.8, 26.8 41.8))',4326)), osm_point.* FROM osm_point
WHERE ST_Intersects(osm_point.way,ST_GeomFromText('POLYGON((26.8 41.8,26.8 82.2,180 82.2,180 41.8, 26.8 41.8))',4326));
ALTER TABLE russia_full_point_attr DROP COLUMN way;
  
--Россия (линии)
CREATE TABLE russia_full_line_attr AS
SELECT 
ST_Intersection(osm_line.way,ST_GeomFromText('POLYGON((26.8 41.8,26.8 82.2,180 82.2,180 41.8, 26.8 41.8))',4326)), osm_line.* FROM osm_line
WHERE ST_Intersects(osm_line.way,ST_GeomFromText('POLYGON((26.8 41.8,26.8 82.2,180 82.2,180 41.8, 26.8 41.8))',4326));
ALTER TABLE russia_full_line_attr DROP COLUMN way;
  
--Россия (дороги)
CREATE TABLE russia_full_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,ST_GeomFromText('POLYGON((26.8 41.8,26.8 82.2,180 82.2,180 41.8, 26.8 41.8))',4326)), osm_roads.* FROM osm_roads
WHERE ST_Intersects(osm_roads.way,ST_GeomFromText('POLYGON((26.8 41.8,26.8 82.2,180 82.2,180 41.8, 26.8 41.8))',4326));
ALTER TABLE russia_full_roads_attr DROP COLUMN way;
  
--Россия (полигоны)
CREATE TABLE russia_full_poly_attr AS
SELECT 
osm_polygon.way as ST_Intersection, osm_polygon.* FROM osm_polygon
WHERE (ST_Intersects(osm_polygon.way,ST_GeomFromText('POLYGON((26.8 41.8,26.8 82.2,180 82.2,180 41.8, 26.8 41.8))',4326))) AND (osm_polygon.valid='true')

UNION

SELECT osm_polygon.way as ST_Intersection, osm_polygon.* FROM osm_polygon
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),ST_GeomFromText('POLYGON((26.8 41.8,26.8 82.2,180 82.2,180 41.8, 26.8 41.8))',4326))) AND (osm_polygon.valid='false');
ALTER TABLE russia_full_poly_attr DROP COLUMN way;