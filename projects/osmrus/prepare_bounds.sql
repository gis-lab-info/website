DROP TABLE IF EXISTS T1;
DROP TABLE IF EXISTS RESULTS;

SELECT
(ST_Dump(ST_Split((ST_Dump(ST_Split(ST_Union(ST_Buffer(ST_Transform(the_geom,900913),10000)),ST_Transform(ST_SetSRID(ST_Makeline(ST_Makepoint(179.99,89),ST_Makepoint(179.99,-89)),4326),900913)))).geom,
ST_Transform(ST_SetSRID(ST_Makeline(ST_Makepoint(-179.99,89),ST_Makepoint(-179.99,-89)),4326),900913)))).geom AS the_geom, reg
INTO T1
FROM all_bounds
GROUP BY reg;

DELETE
FROM T1
WHERE ((reg='russia' OR reg='chukot') AND ST_XMAX(ST_Centroid(the_geom)) > ST_XMAX(ST_Transform(ST_SetSRID(ST_Makepoint(179.99,89),4326),900913))) OR
      ((reg='chukot2' OR reg='russia') AND ST_XMAX(ST_Centroid(the_geom)) < ST_XMAX(ST_Transform(ST_SetSRID(ST_Makepoint(-179.99,89),4326),900913)));

SELECT
ST_Transform(the_geom,4326) AS the_geom, reg
INTO RESULTS
FROM T1;

DROP TABLE T1;