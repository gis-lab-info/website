function init_map() {
	OpenLayers.ProxyHost = "/cgi-bin/proxy.py?url=";
	map = new OpenLayers.Map('map', {
		units: 'dd',
		scales: [6000000, 2500000, 1000000, 500000, 200000, 100000],
		projection: new OpenLayers.Projection('EPSG:4326'),
		maxExtent: new OpenLayers.Bounds(75.075, 49.083, 89.870, 57.258),
		transitionEffect: 'resize',
		controls: []
	});
	map.addControl(new OpenLayers.Control.PanZoomBar());
	map.addControl(new OpenLayers.Control.MousePosition());
	map.addControl(new OpenLayers.Control.Navigation({zoomWheelEnabled: true, handleRightClicks: false}));
	map.addControl(new OpenLayers.Control.Scale());
	map.addControl(new OpenLayers.Control.ScaleLine());

	var topo = new OpenLayers.Layer.WMS('Топосъемка',
		'http://gis-lab.info:8180/geoserver/wms',
		{layers: 'topo', format: 'image/gif'},
		{isBaseLayer: true}
	);
	
	var thematic_1 = new OpenLayers.Layer.WMS('Экорегионы',
		'http://gis-lab.info:8180/geoserver/wms',
		{layers: 'geosample:ecoregions', format: 'image/png', transparent: 'true'},
		{isBaseLayer: false, displayInLayerSwitcher: false, visibility: false, opacity: 0.7}
	);
	var thematic_2 = new OpenLayers.Layer.WMS('Почвы',
		'http://gis-lab.info:8180/geoserver/wms',
		{layers: 'geosample:soils', format: 'image/png', transparent: 'true'},
		{isBaseLayer: false, displayInLayerSwitcher: false, visibility: false, opacity: 0.7}
	);
	var thematic_3 = new OpenLayers.Layer.WMS('Растительность',
		'http://gis-lab.info:8180/geoserver/wms',
		{layers: 'geosample:veg', format: 'image/png', transparent: 'true'},
		{isBaseLayer: false, displayInLayerSwitcher: false, visibility: false, opacity: 0.7}
	);
	thematicLayers = {
		'ecoregions': thematic_1,
		'soils': thematic_2,
		'veg': thematic_3
	};
	
	var oopt = new OpenLayers.Layer.WMS('Охраняемые территории',
		'http://gis-lab.info:8180/geoserver/wms',
		{layers: 'geosample:oopt', format: 'image/png', transparent: 'true'},
		{isBaseLayer: false, visibility: false}
	);

	for(i in thematicLayers) {
		map.addLayer(thematicLayers[i]);
	}
	map.addLayers([topo, oopt]);
	map.setBaseLayer(topo);

	wms_info = new OpenLayers.Control.WMSGetFeatureInfo({
		title: 'wmsinfo',
		layers: [thematic_1, thematic_2, thematic_3, oopt],
		url: 'http://gis-lab.info:8180/geoserver/wms',
		infoFormat: 'application/vnd.ogc.gml',
		queryVisible: true
	});
	wms_info.events.register('getfeatureinfo', this, showInfo);
	map.addControl(wms_info);
	wms_info.activate();

	map.zoomToMaxExtent();
}

function selectThematicLayers(e) {
	// отключаем все тематические слои
	for(i in thematicLayers) {
		thematicLayers[i].setVisibility(false);
	}
	// включаем нужный
	if (e.value != 'none') {
		thematicLayers[e.value].setVisibility(true);
	}
}

function checkOopt(e) {
	var layer = map.getLayersByName('Охраняемые территории')
	if (e.checked) {
		layer[0].setVisibility(true);
	} else
		layer[0].setVisibility(false);
}
		
function showInfo(e) {
	var reg_oopt = /^oopt\./;
	var reg_ecoregions = /^ecoregions\./;
	var reg_soils = /^soils\./;
	var reg_veg = /^veg\./;

	// собираем из аттрибутов информацию
	var text = '';
	for(i in e.features) {
		if (i != 0) text += '<br>';
		if (reg_oopt.test(e.features[i].fid)) {
			if (e.features.length != 1)
				text += '<b>Охраняемые территории:</b><br>';
			text += e.features[i].attributes.TYPE + ' "' +
					e.features[i].attributes.NAME_R + '"<br>' +
					'Площадь: ' +
					(e.features[i].geometry.getGeodesicArea(
						new OpenLayers.Projection('EPSG:28415')
					)/1000000).toFixed(2) + " км2";
		} else if (reg_ecoregions.test(e.features[i].fid)) {
			if (e.features.length != 1)
				text += '<b>Экорегионы:</b><br>';
			text += '<a href="' + e.features[i].attributes.WEBLINK +
					'">' + e.features[i].attributes.ECO_NAME_R + '</a>';
		} else if (reg_soils.test(e.features[i].fid)) {
			if (e.features.length != 1)
				text += '<b>Почвы:</b><br>';
			text += e.features[i].attributes.NAME + ' (' +
					e.features[i].attributes.FAOSOIL + ')';
		} else if (reg_veg.test(e.features[i].fid)) {
			if (e.features.length != 1)
				text += '<b>Растительность:</b><br>';
			text += 'Тип: ' + e.features[i].attributes.TYPE + '<br>' +
					'Подтип: ' + e.features[i].attributes.SUBTYPE;
		}
	}

	popup = new OpenLayers.Popup.FramedCloud("popup",
					map.getLonLatFromPixel(e.xy),
					new OpenLayers.Size(200,200),
					text,
					null,
					true
				);
	map.addPopup(popup);
};

// прозрачность тематических слоев
function changeOpacity(e) {
	var newOpacity = (parseFloat(OpenLayers.Util.getElement('opacity').value) + e).toFixed(1);
	if ((newOpacity <= 1.0) && (newOpacity > 0.0)) {
		OpenLayers.Util.getElement('opacity').value = newOpacity;
		for(i in thematicLayers) {
			thematicLayers[i].setOpacity(newOpacity);
		}
	}
}