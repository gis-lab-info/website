dropdb -U pgsql -W topocheck
createdb -U pgsql -E utf8 topocheck
createlang -U pgsql plpgsql topocheck
psql -U pgsql -d topocheck -f /usr/local/share/postgis/contrib/postgis.sql
psql -U pgsql -d topocheck -f /usr/local/share/postgis/contrib/spatial_ref_sys.sql
cd /home/sim/gl/projects/osmrus/bin/osm2pgsql/
./osm2pgsql -U pgsql -d topocheck -p osm -c -l -s -S default.style -C 1024 ../../data/topocheck/topocheck.osm
cd ../..
psql -U pgsql -f cr.sql -d topocheck
psql -d topocheck -U pgsql -c "select ST_IsValidReason(way),osm_id from osm_polygon where ST_IsValid(way)<>'t'"
