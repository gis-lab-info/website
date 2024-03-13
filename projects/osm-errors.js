var B;
var boxes = new OpenLayers.Layer.Boxes("boxes");
function init() {
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
	map.addControl(new OpenLayers.Control.LayerSwitcher());
	
	mapnik = new OpenLayers.Layer.OSM.Mapnik("Mapnik");
	
	//legend
	//var layer_legend = new Legend("http://gis-lab.info/cgi-bin/mapserv?map=/usr/local/www/gis-lab/data/projects/osmrus/errors-wms/wms.map");
	//layer_legend.addLayer("osm-errors"); //legend: layer_legend
	
	//WMS layer
	var errors = new OpenLayers.Layer.WMS(
		"osm-errors",
		"http://gis-lab.info/cgi-bin/mapserv?map=/usr/local/www/gis-lab/data/projects/osmrus/errors-wms/wms.map",
		{layers: 'osm-errors', transparent: 'true', format: 'image/png'}
	);
	
	
		
	//var landuse = new OpenLayers.Layer.WMS(
//		"landuse-l",
//		"http://gis-lab.info/cgi-bin/mapserv?map=/usr/local/www/gis-lab/data/projects/osmrus/errors-wms/wms.map",
//		{layers: 'landuse-l',transparent: 'true', format: 'image/png'},{visibility:true}
//	);
//	
//	var city = new OpenLayers.Layer.WMS(
//		"city-l",
//		"http://gis-lab.info/cgi-bin/mapserv?map=/usr/local/www/gis-lab/data/projects/osmrus/errors-wms/wms.map",
//		{layers: 'city-l',transparent: 'true', format: 'image/png'},{visibility:true}
//	);
	
	
	//add layers
	map.addLayer(errors);
	//map.addLayer(landuse);
	//map.addLayer(city);
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
	map.addControl(new OpenLayers.Control.Permalink());
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
		var alinksimple = 'http://www.osm.org/?mlon=';
		var step = 0.005;

		if(e.features.length != 0) {
			
			lon += e.features[0].attributes.LON;
			lat += e.features[0].attributes.LAT;
			
			//start OSM IDs and stuff
			//loadXML("http://osmxapi.hypercube.telascience.org/api/0.6/map?bbox=11.54,48.14,11.543,48.145");
			//loadXML("http://gis-lab.info/cgi-bin/proxy.py?url=http://www.informationfreeway.org/api/0.6/map?bbox=11.54,48.14,11.543,48.145");
			//alert("success");
			//end OSM
			
			alinkjosm += "left=" + (parseFloat(lon) - step) + "&bottom=" + (parseFloat(lat) - step) + "&right=" + (parseFloat(lon) + step) + "&top=" + (parseFloat(lat) + step) ;
			alinkpotl += lon + "&lat=" + lat + "&zoom=16";
			alinksimple += lon + "&mlat=" + lat + "&zoom=16";
			
			text += "<a href = '" + alinkjosm + "' target='blank'>Редактировать в JOSM</a><br>";
			text += "<a href = '" + alinkpotl + "' target='blank'>Редактировать в Potlatch</a><br>";
			text += "<a href = '" + alinksimple + "' target='blank'>Ссылка</a><br>";
			text += "<a href = 'http://www.openstreetmap.org/browse/way/" + e.features[0].attributes.ID + "/history' target='blank'>История связанного объекта</a><br>";
			text += "Тип ошибки: " + e.features[0].attributes.Descript + "<br>";
			text += "";
			
			popup = new OpenLayers.Popup.FramedCloud("popup",
						map.getLonLatFromPixel(e.xy),
						new OpenLayers.Size(200,200),
						text,
						null,
						true
					);
			map.addPopup(popup);
		}
}
function loadXML(url) {
        var xhr_object = null;
        if(window.XMLHttpRequest) // Firefox
                xhr_object = new XMLHttpRequest();
        else if(window.ActiveXObject) // Internet Explorer
                xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
        else { // XMLHttpRequest non supporté par le navigateur
                alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
                return;
        }
        xhr_object.open("GET", url, false);
        var text = null;
        xhr_object.onreadystatechange = function() {
                if(xhr_object.readyState == 4)  {
                        text=xhr_object.responseText;
                }
        }
        xhr_object.send(null);  
        return bb.xml.parse(text);
}    
function select_func(A) {
	var B = A;
	var bounds = new OpenLayers.Bounds.fromString(B);
	map.zoomToExtent(bounds);
	//var box = new OpenLayers.Marker.Box(bounds);
	//boxes.addMarker(box);
	//map.addLayer(boxes);
} 
