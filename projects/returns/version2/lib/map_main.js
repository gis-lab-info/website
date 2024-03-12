/* TODO:
	- обработчики ошибок для всех *_load
*/
var map, lay_ring, lay_lines, lay_lines_hover;

function init() {
	init_map();
	change_lang('ru');
	resize_f();
	document.getElementById('lang').selectedIndex = 0;
	
	// создаем пустой массив выбранных видов птиц
	species_selected = new Array(12);
	for(i=0; i < species_selected.length; i++) {
		species_selected[i] = '';
	}
}

function resize_f() {
	document.getElementById('map').style.width
		= document.body.clientWidth
		- document.getElementById('species').offsetWidth
		- 40
		+ "px";
}

function init_map() {
	//OpenLayers.ProxyHost = "./lib/proxy.py?url=";
	OpenLayers.ProxyHost = "/cgi-bin/proxy.py?url=";
	var url_server = 'http://gis-lab.info:8180';
	var url_server_2 = 'http://gis-lab.info/cgi-bin/mapserv';
	var url_server_2_map = '/usr/local/www/gis-lab/data/projects/returns/version2/lib/umn/ornito.map';
	//var url_server_2 = 'http://localhost/cgi-bin/mapserv.exe';
	//var url_server_2_map = 'd:/work/web-dev/ornito_2/work/return_lines/ornito.map';
	
	map = new OpenLayers.Map('map', {
		projection: new OpenLayers.Projection('EPSG:900913'),
		displayProjection: new OpenLayers.Projection('EPSG:4326'),
		units: 'm',
		maxResolution: 156543.0339,
		maxExtent: new OpenLayers.Bounds(-20037508.34, -20037508.34, 20037508.34, 20037508.34),
		controls: [
			new OpenLayers.Control.PanZoomBar(),
			new OpenLayers.Control.MousePosition(),
			new OpenLayers.Control.LayerSwitcher({'ascending': false}),
			new OpenLayers.Control.Scale(),
			new OpenLayers.Control.Navigation
		]
	});

	var topo_1 = new OpenLayers.Layer.Google('Google Map', {type: G_NORMAL_MAP, sphericalMercator: true});
	var topo_2 = new OpenLayers.Layer.Google('Google Satellite', {type: G_SATELLITE_MAP, sphericalMercator: true});
	var topo_3 = new OpenLayers.Layer.Google('Google Hybrid', {type: G_HYBRID_MAP, sphericalMercator: true});
	var topo_4 = new OpenLayers.Layer.Google('Google physical', {type: G_PHYSICAL_MAP, sphericalMercator: true});

	lay_ring = new OpenLayers.Layer.WMS('ring',
		url_server + '/geoserver/wms/',
		{layers: 'ornito:anser_2', transparent: true},
		{isBaseLayer: false, wrapDateLine: true, displayInLayerSwitcher: false}
	);
/*
	lay_lines = new OpenLayers.Layer.WMS('lines',
		url_server + '/geoserver/wms/',
//		url_server_2,
		{layers: 'anser-line_2', transparent: true},
		{isBaseLayer: false, visability: false, wrapDateLine: true, gutter: 15}
	);
*/
	lay_lines = new OpenLayers.Layer.WMS('lines',
		url_server_2, {
			map: url_server_2_map,
			layers: 'anser-line_2',
			transparent: true,
		}, {
			isBaseLayer: false,
			displayInLayerSwitcher: false,
			wrapDateLine: true,
			gutter: 15
		}
	);
	
	var lines_style = new OpenLayers.StyleMap({
		'default': new OpenLayers.Style({
			strokeWidth: 1,
			strokeColor: "black",
		})
	});

	lay_lines_hover = new OpenLayers.Layer.Vector('line-hover', {
			strategies: [new OpenLayers.Strategy.Fixed({preload: true})],
			protocol: new OpenLayers.Protocol.WFS({
				url:  url_server + '/geoserver/wfs',
				featureType: 'anser-line_2',
				featureNS: 'http://gis-lab.info/ornito',
				srsName: 'EPSG:900913',
				version: '1.1.0'
			})
		}, {
			visibility: false, wrapDateLine: true, displayInLayerSwitcher: false
		}
	);

	var wms_ctrl = new OpenLayers.Control.WMSGetFeatureInfo({
		layerUrls: [url_server],
		title: 'wmsinfo',
		layers: [lay_ring],
		infoFormat: 'application/vnd.ogc.gml',
		queryVisible: true,
		hover: false
	});
	wms_ctrl.events.register('getfeatureinfo', this, ring_click);
	map.addControl(wms_ctrl);
	wms_ctrl.activate();

	map.addLayers([topo_1, topo_2, topo_3, topo_4]);
	//map.addLayers([lay_lines, lay_lines_hover, lay_ring]);
	map.addLayers([lay_lines, lay_ring]);
	map.setBaseLayer(topo_1);
	
	lay_ring.setVisibility(true);
	lay_lines.setVisibility(false);
	//lay_lines_hover.setVisibility(false);
	
	var point = new OpenLayers.LonLat(68, 61.5);
	map.setCenter(
		point.transform(
			new OpenLayers.Projection("EPSG:4326"),
			map.getProjectionObject()
		), 3
	);
}

function show_lines(e) {
	lay_lines.setVisibility(e.checked);
}