function init_map() {
	var lat=60;
	var lon=90;
	var zoom=3;
	
	map = new OpenLayers.Map ("map", {
		controls:[
			new OpenLayers.Control.Navigation(),
			new OpenLayers.Control.PanZoomBar(),
			new OpenLayers.Control.Attribution()],
		maxExtent: new OpenLayers.Bounds(-20037508.34,-20037508.34,20037508.34,20037508.34),
		maxResolution: 156543.0399,
		numZoomLevels: 19,
		units: 'm',
		projection: new OpenLayers.Projection("EPSG:900913"),
		displayProjection: new OpenLayers.Projection("EPSG:4326")
	} );
	
	mapnik = new OpenLayers.Layer.OSM.Mapnik("Mapnik");
	
	var errors = new OpenLayers.Layer.WMS(
	"osm-errors",
	"http://gis-lab.info/cgi-bin/mapserv?map=/usr/local/www/gis-lab/data/projects/osmrus/errors-wms/wms.map",
	{layers: 'osm-errors', transparent: 'true', format: 'image/png'}
	);
	
	map.addLayer(errors);
	map.addLayer(mapnik);
	
	wms_info = new OpenLayers.Control.WMSGetFeatureInfo({
		title: 'wmsinfo',
		layers: [errors],
		url: "http://gis-lab.info/cgi-bin/mapserv?map=/usr/local/www/gis-lab/data/projects/osmrus/errors-wms/wms.map",
		infoFormat: 'application/vnd.ogc.gml',
		queryVisible: true
	});
	
	wms_info.events.register('getfeatureinfo', this, showInfo);
	
	map.addControl(wms_info);
	wms_info.activate();
	
	
	if( ! map.getCenter() ){
		var lonLat = new OpenLayers.LonLat(lon, lat).transform(new OpenLayers.Projection("EPSG:4326"), map.getProjectionObject());
		map.setCenter (lonLat, zoom);
	}
}

function showInfo(e) {
        var text = '';
		var lat = '';
		var lon = '';
		var alinkjosm = 'http://localhost:8111/load_and_zoom?';
		var alinkpotl = 'http://www.openstreetmap.org/edit?lon=';
		var step = 0.005;
		
		lon += map.getLonLatFromPixel(e.xy).lon;
		lat += map.getLonLatFromPixel(e.xy).lat;
		
		var lonLat = new OpenLayers.LonLat(lon, lat).transform(new OpenLayers.Projection("EPSG:900913"), new OpenLayers.Projection("EPSG:4326"));
		
		lon = lonLat.lon;
		lat = lonLat.lat;
		
		alinkjosm += "left=" + (parseFloat(lon) - step) + "&bottom=" + (parseFloat(lat) - step) + "&right=" + (parseFloat(lon) + step) + "&top=" + (parseFloat(lat) + step) ;
		alinkpotl += lon + "&lat=" + lat + "&zoom=16";
		text += "<a href = '" + alinkjosm + "' target='blank'>Редактировать в JOSM</a><br>";
		text += "<a href = '" + alinkpotl + "' target='blank'>Редактировать в Potlatch</a>";
		//http://www.openstreetmap.org/edit?lon=20.94472&lat=55.70535&zoom=18&way=35095662
		
		popup = new OpenLayers.Popup.FramedCloud("popup",
					map.getLonLatFromPixel(e.xy),
					new OpenLayers.Size(200,200),
					text,
					null,
					true
				);
		map.addPopup(popup);
}
