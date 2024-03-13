var map, country_db;

function init() {
	OpenLayers.ProxyHost = "./lib/proxy.py?url=";
	map = new OpenLayers.Map('map', {
		units: 'dd',
		projection: new OpenLayers.Projection('EPSG:4326'),
		maxExtent: new OpenLayers.Bounds(-180, -90, 180, 90),
		resolutions: [0.703125, 0.3515625, 0.17578125, 0.087890625,
			0.0439453125, 0.02197265625, 0.010986328125,
			0.0054931640625, 0.00274658203125, 0.001373291015625,
			6.866455078125E-4, 3.4332275390625E-4, 1.71661376953125E-4,
			8.58306884765625E-5, 4.291534423828125E-5, 2.1457672119140625E-5,
			1.0728836059570312E-5, 5.364418029785156E-6, 2.682209014892578E-6,
			1.341104507446289E-6, 6.705522537231445E-7, 3.3527612686157227E-7,
			1.6763806343078613E-7, 8.381903171539307E-8, 4.190951585769653E-8,
			2.0954757928848267E-8, 1.0477378964424133E-8, 5.238689482212067E-9,
			2.6193447411060333E-9, 1.3096723705530167E-9, 6.548361852765083E-10
		],
		//numZoomLevels: 16,
		transitionEffect: 'resize',
		controls: []
	});
	map.addControl(new OpenLayers.Control.PanZoomBar());
	map.addControl(new OpenLayers.Control.MousePosition());
	map.addControl(new OpenLayers.Control.Navigation({zoomWheelEnabled: true, handleRightClicks: false}));
	map.addControl(new OpenLayers.Control.Scale());
	map.addControl(new OpenLayers.Control.ScaleLine());
	map.addControl(new OpenLayers.Control.LayerSwitcher({'ascending': false}));

	var topo = new OpenLayers.Layer.WMS('VMap0',
		'http://gis-lab.info:8180/geowebcache/service/wms',
//		'http://labs.metacarta.com/wms/vmap0',
		{layers: 'basic'},
		{wrapDateLine: true}
	);
	
	var ring = new OpenLayers.Layer.WMS('anser',
		'http://gis-lab.info:8180/geoserver/wms/',
		{layers: 'ornito:anser', transparent: true},
		{isBaseLayer: false, wrapDateLine: true}
	);

	var lines = new OpenLayers.Layer.WMS('anser-line',
		'http://gis-lab.info:8180/geoserver/wms/',
		{layers: 'ornito:anser-line', transparent: true},
		{isBaseLayer: false, visibility: false, wrapDateLine: true}
	);

	var lines_style = new OpenLayers.StyleMap({
		'default': new OpenLayers.Style({
			strokeWidth: 1,
			strokeColor: "black",
		})
	});

	var lines_hover = new OpenLayers.Layer.Vector('anser-line-hover', {
		strategies: [new OpenLayers.Strategy.Fixed({preload: true})],
		protocol: new OpenLayers.Protocol.WFS({
			url:  'http://gis-lab.info:8180/geoserver/wfs',
			featureType: 'anser-line',
			featureNS: 'http://gis-lab.info/ornito',
			srsName: 'EPSG:4326',
			version: '1.1.0'
		})},
		{visibility: false, wrapDateLine: true}
	);
	
	map.addLayers([topo, ring, lines, lines_hover]);
	map.setBaseLayer(topo);
	//map.addLayers([ring, lines, lines_hover]);
	//map.setBaseLayer(ring);

	var wms_ctrl = new OpenLayers.Control.WMSGetFeatureInfo({
		layerUrls: ['http://gis-lab.info:8180/geoserver/wms/'],
		title: 'wmsinfo',
		layers: [ring],
		infoFormat: 'application/vnd.ogc.gml',
		queryVisible: true,
		hover: false
	});
	wms_ctrl.events.register('getfeatureinfo', this, selectedPoint);
	map.addControl(wms_ctrl);
	wms_ctrl.activate();

	reset_hover();
	init_db();
	load_country_list()
	lines_hover.setVisibility(true);
	map.setCenter(new OpenLayers.LonLat(47, 49.5), 3);
	//map.setCenter(new OpenLayers.LonLat(0, 0), 7);
}

// line-hover
function selectedPoint(e) {
	if (e.features.length > 0) {
		line_hover_filter = [];
		for (i in e.features) {
			line_hover_filter.push(
				new OpenLayers.Filter.Comparison({
					type: OpenLayers.Filter.Comparison.EQUAL_TO,
					property: 'NN',
					value: e.features[i].attributes['NN']
				})
			);
		}
		var layer = map.getLayersByName('anser-line-hover');
		var strategy = layer[0].strategies[0];
		layer[0].protocol.read({
			filter: filter = new OpenLayers.Filter.Logical({
				type: OpenLayers.Filter.Logical.OR,
				filters: line_hover_filter
			}),
			callback: strategy.merge,
			scope: strategy
		});
	}
}

function reset_hover() {
	var layer = map.getLayersByName('anser-line-hover');
	var strategy = layer[0].strategies[0];
	layer[0].protocol.read({
		filter: filter = new OpenLayers.Filter.Logical({
			type: OpenLayers.Filter.Logical.AND,
			filters: [
				new OpenLayers.Filter.Comparison({
					type: OpenLayers.Filter.Comparison.EQUAL_TO,
					property: 'NN',
					value: '0'
				})
			]
		}),
		callback: strategy.merge,
		scope: strategy
	});
}
