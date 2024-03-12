import os
import re
os.system('del osm-errors.*')
os.system('psql  -d osm -U labinfo -W -c "select ST_IsValidReason(way) from osm_polygon where ST_IsValid(way)<>\'t\'" >errors_tmp.txt')
err_tmp=open('errors_tmp.txt','rt')
err=open('errors.csv','wt')
err.write('Error description,LON,LAT\n')
for str in err_tmp:
    mystr=str.replace(' [',',')
    mystr=mystr.replace(']','')
    mystr=re.sub('(?<=\d) +',',',mystr)
    if re.search("[@A-Z]", mystr):
        err.write(mystr.lstrip())
fvrt = open('errors.vrt', 'wt')
fvrt.write('<OGRVRTDataSource>\n'
           '<OGRVRTLayer name="errors">\n'
           '<SrcDataSource>errors.csv</SrcDataSource>\n'
           '<GeometryType>wkbPoint</GeometryType>\n'
           '<LayerSRS>WGS84</LayerSRS>\n'
           '<GeometryField encoding="PointFromColumns" x="LON" y="LAT"/>\n'
           '</OGRVRTLayer>\n'
           '</OGRVRTDataSource>\n')
fvrt.close()
err_tmp.close()
err.close()
os.system('ogr2ogr osm-errors.shp errors.vrt')
os.system('del errors.vrt errors_tmp.txt errors.csv')