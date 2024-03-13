--Алтайский край (точки)
DROP TABLE IF EXISTS altayskiy_point_attr;
DROP TABLE IF EXISTS altayskiy_line_attr;
DROP TABLE IF EXISTS altayskiy_roads_attr;
DROP TABLE IF EXISTS altayskiy_poly_attr;

CREATE TABLE altayskiy_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Алтайский край');
ALTER TABLE altayskiy_point_attr DROP COLUMN way;
  
--Алтайский край (линии)
CREATE TABLE altayskiy_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Алтайский край');
ALTER TABLE altayskiy_line_attr DROP COLUMN way;
  
--Алтайский край (дороги)
CREATE TABLE altayskiy_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Алтайский край');
ALTER TABLE altayskiy_roads_attr DROP COLUMN way;
  
--Алтайский край (полигоны)
CREATE TABLE altayskiy_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Алтайский край')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Алтайский край');
ALTER TABLE altayskiy_poly_attr DROP COLUMN way;

--Республика Адыгея (точки)
DROP TABLE IF EXISTS adygeya_point_attr;
DROP TABLE IF EXISTS adygeya_line_attr;
DROP TABLE IF EXISTS adygeya_roads_attr;
DROP TABLE IF EXISTS adygeya_poly_attr;

CREATE TABLE adygeya_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Адыгея (Адыгея)');
ALTER TABLE adygeya_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE adygeya_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Адыгея (Адыгея)');
ALTER TABLE adygeya_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE adygeya_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Адыгея (Адыгея)');
ALTER TABLE adygeya_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE adygeya_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Адыгея (Адыгея)')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Адыгея (Адыгея)');
ALTER TABLE adygeya_poly_attr DROP COLUMN way;
  
--Республика Алтай(точки)
DROP TABLE IF EXISTS altay_point_attr;
DROP TABLE IF EXISTS altay_line_attr;
DROP TABLE IF EXISTS altay_roads_attr;
DROP TABLE IF EXISTS altay_poly_attr;

CREATE TABLE altay_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Алтай');
ALTER TABLE altay_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE altay_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Алтай');
ALTER TABLE altay_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE altay_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Алтай');
ALTER TABLE altay_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE altay_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Алтай')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Алтай');
ALTER TABLE altay_poly_attr DROP COLUMN way;
  
--Амурская область (точки)
DROP TABLE IF EXISTS amur_point_attr;
DROP TABLE IF EXISTS amur_line_attr;
DROP TABLE IF EXISTS amur_roads_attr;
DROP TABLE IF EXISTS amur_poly_attr;

CREATE TABLE amur_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Амурская область');
ALTER TABLE amur_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE amur_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Амурская область');
ALTER TABLE amur_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE amur_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Амурская область');
ALTER TABLE amur_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE amur_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Амурская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Амурская область');
ALTER TABLE amur_poly_attr DROP COLUMN way;

--Архангельская область (точки)
DROP TABLE IF EXISTS arkhan_point_attr;
DROP TABLE IF EXISTS arkhan_line_attr;
DROP TABLE IF EXISTS arkhan_roads_attr;
DROP TABLE IF EXISTS arkhan_poly_attr;

CREATE TABLE arkhan_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Архангельская область');
ALTER TABLE arkhan_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE arkhan_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Архангельская область');
ALTER TABLE arkhan_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE arkhan_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Архангельская область');
ALTER TABLE arkhan_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE arkhan_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Архангельская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Архангельская область');
ALTER TABLE arkhan_poly_attr DROP COLUMN way;
  
--Астраханская область (точки)
DROP TABLE IF EXISTS astrakhan_point_attr;
DROP TABLE IF EXISTS astrakhan_line_attr;
DROP TABLE IF EXISTS astrakhan_roads_attr;
DROP TABLE IF EXISTS astrakhan_poly_attr;

CREATE TABLE astrakhan_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Астраханская область');
ALTER TABLE astrakhan_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE astrakhan_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Астраханская область');
ALTER TABLE astrakhan_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE astrakhan_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Астраханская область');
ALTER TABLE astrakhan_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE astrakhan_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Астраханская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Астраханская область');
ALTER TABLE astrakhan_poly_attr DROP COLUMN way;
  
--Республика Башкортостан (точки)
DROP TABLE IF EXISTS bashkir_point_attr;
DROP TABLE IF EXISTS bashkir_line_attr;
DROP TABLE IF EXISTS bashkir_roads_attr;
DROP TABLE IF EXISTS bashkir_poly_attr;

CREATE TABLE bashkir_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Башкортостан');
ALTER TABLE bashkir_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE bashkir_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Башкортостан');
ALTER TABLE bashkir_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE bashkir_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Башкортостан');
ALTER TABLE bashkir_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE bashkir_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Башкортостан')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Башкортостан');
ALTER TABLE bashkir_poly_attr DROP COLUMN way;
  
--Белгородская область (точки)
DROP TABLE IF EXISTS belgorod_point_attr;
DROP TABLE IF EXISTS belgorod_line_attr;
DROP TABLE IF EXISTS belgorod_roads_attr;
DROP TABLE IF EXISTS belgorod_poly_attr;

CREATE TABLE belgorod_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Белгородская область');
ALTER TABLE belgorod_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE belgorod_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Белгородская область');
ALTER TABLE belgorod_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE belgorod_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Белгородская область');
ALTER TABLE belgorod_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE belgorod_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Белгородская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Белгородская область');
ALTER TABLE belgorod_poly_attr DROP COLUMN way;
  
--Брянская область (точки)
DROP TABLE IF EXISTS bryansk_point_attr;
DROP TABLE IF EXISTS bryansk_line_attr;
DROP TABLE IF EXISTS bryansk_roads_attr;
DROP TABLE IF EXISTS bryansk_poly_attr;

CREATE TABLE bryansk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Брянская область');
ALTER TABLE bryansk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE bryansk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Брянская область');
ALTER TABLE bryansk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE bryansk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Брянская область');
ALTER TABLE bryansk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE bryansk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Брянская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Брянская область');
ALTER TABLE bryansk_poly_attr DROP COLUMN way;
  
--Республика Бурятия (точки)
DROP TABLE IF EXISTS buryat_point_attr;
DROP TABLE IF EXISTS buryat_line_attr;
DROP TABLE IF EXISTS buryat_roads_attr;
DROP TABLE IF EXISTS buryat_poly_attr;

CREATE TABLE buryat_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Бурятия');
ALTER TABLE buryat_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE buryat_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Бурятия');
ALTER TABLE buryat_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE buryat_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Бурятия');
ALTER TABLE buryat_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE buryat_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Бурятия')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Бурятия');
ALTER TABLE buryat_poly_attr DROP COLUMN way;
  
--Владимирская область (точки)
DROP TABLE IF EXISTS vladimir_point_attr;
DROP TABLE IF EXISTS vladimir_line_attr;
DROP TABLE IF EXISTS vladimir_roads_attr;
DROP TABLE IF EXISTS vladimir_poly_attr;

CREATE TABLE vladimir_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Владимирская область');
ALTER TABLE vladimir_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE vladimir_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Владимирская область');
ALTER TABLE vladimir_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE vladimir_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Владимирская область');
ALTER TABLE vladimir_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE vladimir_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Владимирская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Владимирская область');
ALTER TABLE vladimir_poly_attr DROP COLUMN way;
  
--Волгоградская область (точки)
DROP TABLE IF EXISTS volgograd_point_attr;
DROP TABLE IF EXISTS volgograd_line_attr;
DROP TABLE IF EXISTS volgograd_roads_attr;
DROP TABLE IF EXISTS volgograd_poly_attr;

CREATE TABLE volgograd_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Волгоградская область');
ALTER TABLE volgograd_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE volgograd_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Волгоградская область');
ALTER TABLE volgograd_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE volgograd_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Волгоградская область');
ALTER TABLE volgograd_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE volgograd_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Волгоградская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Волгоградская область');
ALTER TABLE volgograd_poly_attr DROP COLUMN way;
  
--Вологодская область (точки)
DROP TABLE IF EXISTS vologda_point_attr;
DROP TABLE IF EXISTS vologda_line_attr;
DROP TABLE IF EXISTS vologda_roads_attr;
DROP TABLE IF EXISTS vologda_poly_attr;

CREATE TABLE vologda_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Вологодская область');
ALTER TABLE vologda_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE vologda_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Вологодская область');
ALTER TABLE vologda_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE vologda_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Вологодская область');
ALTER TABLE vologda_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE vologda_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Вологодская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Вологодская область');
ALTER TABLE vologda_poly_attr DROP COLUMN way;
  
--Воронежская область (точки)
DROP TABLE IF EXISTS voronezh_point_attr;
DROP TABLE IF EXISTS voronezh_line_attr;
DROP TABLE IF EXISTS voronezh_roads_attr;
DROP TABLE IF EXISTS voronezh_poly_attr;

CREATE TABLE voronezh_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Воронежская область');
ALTER TABLE voronezh_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE voronezh_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Воронежская область');
ALTER TABLE voronezh_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE voronezh_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Воронежская область');
ALTER TABLE voronezh_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE voronezh_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Воронежская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Воронежская область');
ALTER TABLE voronezh_poly_attr DROP COLUMN way;
  
--Республика Дагестан (точки)
DROP TABLE IF EXISTS dagestan_point_attr;
DROP TABLE IF EXISTS dagestan_line_attr;
DROP TABLE IF EXISTS dagestan_roads_attr;
DROP TABLE IF EXISTS dagestan_poly_attr;

CREATE TABLE dagestan_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Дагестан');
ALTER TABLE dagestan_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE dagestan_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Дагестан');
ALTER TABLE dagestan_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE dagestan_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Дагестан');
ALTER TABLE dagestan_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE dagestan_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Дагестан')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Дагестан');
ALTER TABLE dagestan_poly_attr DROP COLUMN way;
  
--Еврейская автономная область (точки)
DROP TABLE IF EXISTS evrey_point_attr;
DROP TABLE IF EXISTS evrey_line_attr;
DROP TABLE IF EXISTS evrey_roads_attr;
DROP TABLE IF EXISTS evrey_poly_attr;

CREATE TABLE evrey_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Еврейская автономная область');
ALTER TABLE evrey_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE evrey_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Еврейская автономная область');
ALTER TABLE evrey_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE evrey_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Еврейская автономная область');
ALTER TABLE evrey_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE evrey_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Еврейская автономная область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Еврейская автономная область');
ALTER TABLE evrey_poly_attr DROP COLUMN way;
  
--Агинский Бурятский автономный округ (точки)
DROP TABLE IF EXISTS aginsk_point_attr;
DROP TABLE IF EXISTS aginsk_line_attr;
DROP TABLE IF EXISTS aginsk_roads_attr;
DROP TABLE IF EXISTS aginsk_poly_attr;

CREATE TABLE aginsk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Агинский Бурятский автономный округ');
ALTER TABLE aginsk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE aginsk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Агинский Бурятский автономный округ');
ALTER TABLE aginsk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE aginsk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Агинский Бурятский автономный округ');
ALTER TABLE aginsk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE aginsk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Агинский Бурятский автономный округ')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Агинский Бурятский автономный округ');
ALTER TABLE aginsk_poly_attr DROP COLUMN way;
  
--Читинская область (точки)
DROP TABLE IF EXISTS chita_point_attr;
DROP TABLE IF EXISTS chita_line_attr;
DROP TABLE IF EXISTS chita_roads_attr;
DROP TABLE IF EXISTS chita_poly_attr;

CREATE TABLE chita_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Читинская область');
ALTER TABLE chita_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE chita_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Читинская область');
ALTER TABLE chita_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE chita_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Читинская область');
ALTER TABLE chita_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE chita_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Читинская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Читинская область');
ALTER TABLE chita_poly_attr DROP COLUMN way;
  
--Ивановская область (точки)
DROP TABLE IF EXISTS ivanov_point_attr;
DROP TABLE IF EXISTS ivanov_line_attr;
DROP TABLE IF EXISTS ivanov_roads_attr;
DROP TABLE IF EXISTS ivanov_poly_attr;

CREATE TABLE ivanov_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ивановская область');
ALTER TABLE ivanov_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE ivanov_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ивановская область');
ALTER TABLE ivanov_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE ivanov_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ивановская область');
ALTER TABLE ivanov_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE ivanov_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ивановская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ивановская область');
ALTER TABLE ivanov_poly_attr DROP COLUMN way;
  
--Республика Ингушетия (точки)
DROP TABLE IF EXISTS ingush_point_attr;
DROP TABLE IF EXISTS ingush_line_attr;
DROP TABLE IF EXISTS ingush_roads_attr;
DROP TABLE IF EXISTS ingush_poly_attr;

CREATE TABLE ingush_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Ингушетия');
ALTER TABLE ingush_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE ingush_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Ингушетия');
ALTER TABLE ingush_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE ingush_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Ингушетия');
ALTER TABLE ingush_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE ingush_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Ингушетия')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Ингушетия');
ALTER TABLE ingush_poly_attr DROP COLUMN way;
  
--Иркутская область (точки)
DROP TABLE IF EXISTS irkutsk_point_attr;
DROP TABLE IF EXISTS irkutsk_line_attr;
DROP TABLE IF EXISTS irkutsk_roads_attr;
DROP TABLE IF EXISTS irkutsk_poly_attr;

CREATE TABLE irkutsk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Иркутская область');
ALTER TABLE irkutsk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE irkutsk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Иркутская область');
ALTER TABLE irkutsk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE irkutsk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Иркутская область');
ALTER TABLE irkutsk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE irkutsk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Иркутская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Иркутская область');
ALTER TABLE irkutsk_poly_attr DROP COLUMN way;
  
--Усть-Ордынский Бурятский автономный округ (точки)
DROP TABLE IF EXISTS ustordyn_point_attr;
DROP TABLE IF EXISTS ustordyn_line_attr;
DROP TABLE IF EXISTS ustordyn_roads_attr;
DROP TABLE IF EXISTS ustordyn_poly_attr;

CREATE TABLE ustordyn_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Усть-Ордынский Бурятский автономный округ');
ALTER TABLE ustordyn_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE ustordyn_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Усть-Ордынский Бурятский автономный округ');
ALTER TABLE ustordyn_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE ustordyn_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Усть-Ордынский Бурятский автономный округ');
ALTER TABLE ustordyn_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE ustordyn_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Усть-Ордынский Бурятский автономный округ')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Усть-Ордынский Бурятский автономный округ');
ALTER TABLE ustordyn_poly_attr DROP COLUMN way;
  
--Кабардино-Балкарская Республика (точки)
DROP TABLE IF EXISTS kabardin_point_attr;
DROP TABLE IF EXISTS kabardin_line_attr;
DROP TABLE IF EXISTS kabardin_roads_attr;
DROP TABLE IF EXISTS kabardin_poly_attr;

CREATE TABLE kabardin_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кабардино-Балкарская Республика');
ALTER TABLE kabardin_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kabardin_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кабардино-Балкарская Республика');
ALTER TABLE kabardin_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kabardin_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кабардино-Балкарская Республика');
ALTER TABLE kabardin_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kabardin_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Кабардино-Балкарская Республика')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Кабардино-Балкарская Республика');
ALTER TABLE kabardin_poly_attr DROP COLUMN way;
  
--Калининградская область (точки)
DROP TABLE IF EXISTS kalinin_point_attr;
DROP TABLE IF EXISTS kalinin_line_attr;
DROP TABLE IF EXISTS kalinin_roads_attr;
DROP TABLE IF EXISTS kalinin_poly_attr;

CREATE TABLE kalinin_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Калининградская область');
ALTER TABLE kalinin_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kalinin_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Калининградская область');
ALTER TABLE kalinin_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kalinin_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Калининградская область');
ALTER TABLE kalinin_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kalinin_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Калининградская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Калининградская область');
ALTER TABLE kalinin_poly_attr DROP COLUMN way;
  
--Республика Калмыкия (точки)
DROP TABLE IF EXISTS kalmyk_point_attr;
DROP TABLE IF EXISTS kalmyk_line_attr;
DROP TABLE IF EXISTS kalmyk_roads_attr;
DROP TABLE IF EXISTS kalmyk_poly_attr;

CREATE TABLE kalmyk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Калмыкия');
ALTER TABLE kalmyk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kalmyk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Калмыкия');
ALTER TABLE kalmyk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kalmyk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Калмыкия');
ALTER TABLE kalmyk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kalmyk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Калмыкия')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Калмыкия');
ALTER TABLE kalmyk_poly_attr DROP COLUMN way;
  
--Калужская область (точки)
DROP TABLE IF EXISTS kaluzh_point_attr;
DROP TABLE IF EXISTS kaluzh_line_attr;
DROP TABLE IF EXISTS kaluzh_roads_attr;
DROP TABLE IF EXISTS kaluzh_poly_attr;

CREATE TABLE kaluzh_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Калужская область');
ALTER TABLE kaluzh_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kaluzh_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Калужская область');
ALTER TABLE kaluzh_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kaluzh_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Калужская область');
ALTER TABLE kaluzh_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kaluzh_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Калужская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Калужская область');
ALTER TABLE kaluzh_poly_attr DROP COLUMN way;
  
--Камчатский край (точки)
DROP TABLE IF EXISTS kamch_point_attr;
DROP TABLE IF EXISTS kamch_line_attr;
DROP TABLE IF EXISTS kamch_roads_attr;
DROP TABLE IF EXISTS kamch_poly_attr;

CREATE TABLE kamch_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Камчатский край');
ALTER TABLE kamch_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kamch_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Камчатский край');
ALTER TABLE kamch_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kamch_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Камчатский край');
ALTER TABLE kamch_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kamch_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Камчатский край')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Камчатский край');
ALTER TABLE kamch_poly_attr DROP COLUMN way;
  
--Карачаево-Черкесская Республика (точки)
DROP TABLE IF EXISTS karach_point_attr;
DROP TABLE IF EXISTS karach_line_attr;
DROP TABLE IF EXISTS karach_roads_attr;
DROP TABLE IF EXISTS karach_poly_attr;

CREATE TABLE karach_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Карачаево-Черкесская Республика');
ALTER TABLE karach_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE karach_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Карачаево-Черкесская Республика');
ALTER TABLE karach_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE karach_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Карачаево-Черкесская Республика');
ALTER TABLE karach_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE karach_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Карачаево-Черкесская Республика')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Карачаево-Черкесская Республика');
ALTER TABLE karach_poly_attr DROP COLUMN way;
  
--Республика Карелия (точки)
DROP TABLE IF EXISTS karel_point_attr;
DROP TABLE IF EXISTS karel_line_attr;
DROP TABLE IF EXISTS karel_roads_attr;
DROP TABLE IF EXISTS karel_poly_attr;

CREATE TABLE karel_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Карелия');
ALTER TABLE karel_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE karel_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Карелия');
ALTER TABLE karel_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE karel_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Карелия');
ALTER TABLE karel_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE karel_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Карелия')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Карелия');
ALTER TABLE karel_poly_attr DROP COLUMN way;
  
--Кемеровская область (точки)
DROP TABLE IF EXISTS kemerovo_point_attr;
DROP TABLE IF EXISTS kemerovo_line_attr;
DROP TABLE IF EXISTS kemerovo_roads_attr;
DROP TABLE IF EXISTS kemerovo_poly_attr;

CREATE TABLE kemerovo_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кемеровская область');
ALTER TABLE kemerovo_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kemerovo_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кемеровская область');
ALTER TABLE kemerovo_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kemerovo_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кемеровская область');
ALTER TABLE kemerovo_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kemerovo_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Кемеровская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Кемеровская область');
ALTER TABLE kemerovo_poly_attr DROP COLUMN way;
  
--Кировская область (точки)
DROP TABLE IF EXISTS kirov_point_attr;
DROP TABLE IF EXISTS kirov_line_attr;
DROP TABLE IF EXISTS kirov_roads_attr;
DROP TABLE IF EXISTS kirov_poly_attr;

CREATE TABLE kirov_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кировская область');
ALTER TABLE kirov_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kirov_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кировская область');
ALTER TABLE kirov_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kirov_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Кировская область');
ALTER TABLE kirov_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kirov_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Кировская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Кировская область');
ALTER TABLE kirov_poly_attr DROP COLUMN way;
  
--Республика Коми (точки)
DROP TABLE IF EXISTS komi_point_attr;
DROP TABLE IF EXISTS komi_line_attr;
DROP TABLE IF EXISTS komi_roads_attr;
DROP TABLE IF EXISTS komi_poly_attr;

CREATE TABLE komi_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Коми');
ALTER TABLE komi_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE komi_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Коми');
ALTER TABLE komi_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE komi_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Республика Коми');
ALTER TABLE komi_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE komi_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Республика Коми')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Республика Коми');
ALTER TABLE komi_poly_attr DROP COLUMN way;
  
--Костромская область (точки)
DROP TABLE IF EXISTS kostrom_point_attr;
DROP TABLE IF EXISTS kostrom_line_attr;
DROP TABLE IF EXISTS kostrom_roads_attr;
DROP TABLE IF EXISTS kostrom_poly_attr;

CREATE TABLE kostrom_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Костромская область');
ALTER TABLE kostrom_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kostrom_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Костромская область');
ALTER TABLE kostrom_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kostrom_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Костромская область');
ALTER TABLE kostrom_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kostrom_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Костромская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Костромская область');
ALTER TABLE kostrom_poly_attr DROP COLUMN way;
  
--Краснодарский край (точки)
DROP TABLE IF EXISTS krasnodar_point_attr;
DROP TABLE IF EXISTS krasnodar_line_attr;
DROP TABLE IF EXISTS krasnodar_roads_attr;
DROP TABLE IF EXISTS krasnodar_poly_attr;

CREATE TABLE krasnodar_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Краснодарский край');
ALTER TABLE krasnodar_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE krasnodar_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Краснодарский край');
ALTER TABLE krasnodar_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE krasnodar_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Краснодарский край');
ALTER TABLE krasnodar_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE krasnodar_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Краснодарский край')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Краснодарский край');
ALTER TABLE krasnodar_poly_attr DROP COLUMN way;
  
--Красноярский край (точки)
DROP TABLE IF EXISTS krasnoyarsk_point_attr;
DROP TABLE IF EXISTS krasnoyarsk_line_attr;
DROP TABLE IF EXISTS krasnoyarsk_roads_attr;
DROP TABLE IF EXISTS krasnoyarsk_poly_attr;

CREATE TABLE krasnoyarsk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Красноярский край');
ALTER TABLE krasnoyarsk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE krasnoyarsk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Красноярский край');
ALTER TABLE krasnoyarsk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE krasnoyarsk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Красноярский край');
ALTER TABLE krasnoyarsk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE krasnoyarsk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Красноярский край')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Красноярский край');
ALTER TABLE krasnoyarsk_poly_attr DROP COLUMN way;
  
--Курганская область (точки)
DROP TABLE IF EXISTS kurgan_point_attr;
DROP TABLE IF EXISTS kurgan_line_attr;
DROP TABLE IF EXISTS kurgan_roads_attr;
DROP TABLE IF EXISTS kurgan_poly_attr;

CREATE TABLE kurgan_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Курганская область');
ALTER TABLE kurgan_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kurgan_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Курганская область');
ALTER TABLE kurgan_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kurgan_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Курганская область');
ALTER TABLE kurgan_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kurgan_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Курганская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Курганская область');
ALTER TABLE kurgan_poly_attr DROP COLUMN way;
  
--Курская область (точки)
DROP TABLE IF EXISTS kursk_point_attr;
DROP TABLE IF EXISTS kursk_line_attr;
DROP TABLE IF EXISTS kursk_roads_attr;
DROP TABLE IF EXISTS kursk_poly_attr;

CREATE TABLE kursk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Курская область');
ALTER TABLE kursk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE kursk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Курская область');
ALTER TABLE kursk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE kursk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Курская область');
ALTER TABLE kursk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE kursk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Курская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Курская область');
ALTER TABLE kursk_poly_attr DROP COLUMN way;
  
--Ленинградская область (точки)
DROP TABLE IF EXISTS leningrad_point_attr;
DROP TABLE IF EXISTS leningrad_line_attr;
DROP TABLE IF EXISTS leningrad_roads_attr;
DROP TABLE IF EXISTS leningrad_poly_attr;

CREATE TABLE leningrad_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ленинградская область');
ALTER TABLE leningrad_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE leningrad_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ленинградская область');
ALTER TABLE leningrad_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE leningrad_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Ленинградская область');
ALTER TABLE leningrad_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE leningrad_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Ленинградская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Ленинградская область');
ALTER TABLE leningrad_poly_attr DROP COLUMN way;
  
--Липецкая область (точки)
DROP TABLE IF EXISTS lipetsk_point_attr;
DROP TABLE IF EXISTS lipetsk_line_attr;
DROP TABLE IF EXISTS lipetsk_roads_attr;
DROP TABLE IF EXISTS lipetsk_poly_attr;

CREATE TABLE lipetsk_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Липецкая область');
ALTER TABLE lipetsk_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE lipetsk_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Липецкая область');
ALTER TABLE lipetsk_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE lipetsk_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Липецкая область');
ALTER TABLE lipetsk_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE lipetsk_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Липецкая область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Липецкая область');
ALTER TABLE lipetsk_poly_attr DROP COLUMN way;
  
--Магаданская область (точки)
DROP TABLE IF EXISTS magadan_point_attr;
DROP TABLE IF EXISTS magadan_line_attr;
DROP TABLE IF EXISTS magadan_roads_attr;
DROP TABLE IF EXISTS magadan_poly_attr;

CREATE TABLE magadan_point_attr AS
SELECT 
ST_Intersection(osm_point.way,russia_bound.the_geom), osm_point.* FROM osm_point, russia_bound
WHERE (ST_Intersects(osm_point.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Магаданская область');
ALTER TABLE magadan_point_attr DROP COLUMN way;
  
-- (линии)
CREATE TABLE magadan_line_attr AS
SELECT 
ST_Intersection(osm_line.way,russia_bound.the_geom), osm_line.* FROM osm_line, russia_bound
WHERE (ST_Intersects(osm_line.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Магаданская область');
ALTER TABLE magadan_line_attr DROP COLUMN way;
  
--(дороги)
CREATE TABLE magadan_roads_attr AS
SELECT 
ST_Intersection(osm_roads.way,russia_bound.the_geom), osm_roads.* FROM osm_roads, russia_bound
WHERE (ST_Intersects(osm_roads.way,russia_bound.the_geom)) AND (russia_bound.kladr_reg='Магаданская область');
ALTER TABLE magadan_roads_attr DROP COLUMN way;
  
--(полигоны)
CREATE TABLE magadan_poly_attr AS
SELECT 
ST_Intersection(osm_polygon.way,russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(osm_polygon.way,russia_bound.the_geom)) AND (osm_polygon.valid='true') AND (russia_bound.kladr_reg='Магаданская область')

UNION

SELECT ST_Intersection(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom), osm_polygon.* FROM osm_polygon, russia_bound
WHERE (ST_Intersects(ST_Buffer(osm_polygon.way,0),russia_bound.the_geom)) AND (osm_polygon.valid='false') AND (russia_bound.kladr_reg='Магаданская область');
ALTER TABLE magadan_poly_attr DROP COLUMN way;