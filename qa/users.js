function init(){
    lon = 80,
    lat = 55,
    zoom = 3,
    epsg4326 = new OpenLayers.Projection('EPSG:4326'),
    epsg900913 = new OpenLayers.Projection('EPSG:900913');

    set_user_class = new OpenLayers.Control.Button({
        title:"Выбор категории участников",
        text_default: "Активные участники",
        text_all_users: "Все участники",
        text_active_users: "Активные участники",
        textSpan: document.createElement('span'),
        button: document.createElement('button'),
        type: OpenLayers.Control.TYPE_TOGGLE,
        eventListeners: {
            'activate': function(){
                set_user_class.textSpan.innerHTML = set_user_class.text_all_users;
                users.setVisibility(false);
                users_all.setVisibility(true);
            }, 
            'deactivate': function(){
                set_user_class.textSpan.innerHTML = set_user_class.text_active_users;
                users.setVisibility(true);
                users_all.setVisibility(false);
            }
        }
    });

    create_new_user = new OpenLayers.Control.Button({
        title:"Зарегистрироваться",
        textSpan: document.createElement('span'),
        button: document.createElement('button'),
        text_default: "Добавить себя на карту",
        type: OpenLayers.Control.TYPE_BUTTON,
        trigger: function() {
            window.open('http://gis-lab.info/forum/ucp.php?i=164', '_top');
        }
    }); 
    
    var panel = new OpenLayers.Control.Panel({
        displayClass: 'customPanel',
        createControlMarkup: function (control) {
            control.button.setAttribute('class', 'btn');
            control.textSpan.innerHTML = control.text_default;
            control.button.appendChild(control.textSpan);
            return control.button;
        }
    });

    panel.addControls([set_user_class, create_new_user]);
    
    map = new OpenLayers.Map('map', {
        units: 'm',
        numZoomLevels: 19,
        controls: [
            new OpenLayers.Control.Navigation(),
            //new OpenLayers.Control.ScaleLine(),
			new OpenLayers.Control.Attribution(),
            new OpenLayers.Control.MousePosition(),
			new OpenLayers.Control.Zoom()
            //new OpenLayers.Control.LayerSwitcher()
        ],
        projection: epsg900913,
        displayProjection: epsg4326 //Is used for displaying coordinates in appropriate CRS by MousePosition control
    });

    //var lay_osm = new OpenLayers.Layer.OSM;
    lay_osm = new OpenLayers.Layer.XYZ(
		"MapBox Streets",
			[ 
    "http://a.tiles.mapbox.com/v3/mapbox.natural-earth-1/${z}/${x}/${y}.png",
    "http://b.tiles.mapbox.com/v3/mapbox.natural-earth-1/${z}/${x}/${y}.png",
    "http://c.tiles.mapbox.com/v3/mapbox.natural-earth-1/${z}/${x}/${y}.png",
    "http://d.tiles.mapbox.com/v3/mapbox.natural-earth-1/${z}/${x}/${y}.png"

], {
			attribution: "Тайлы &copy; <a href='http://mapbox.com/'>MapBox</a> | " + 
				"&copy; Участники <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> ",
			sphericalMercator: true,
			wrapDateLine: true,
			transitionEffect: "resize",
			buffer: 1,
			numZoomLevels: 17	
		}
	);
	
    sm = new OpenLayers.StyleMap({
        "default": {"pointRadius": 12, "externalGraphic": "../images/amenity_library2.glow.24.png"},
        "select": {"pointRadius": 16, "externalGraphic": "../images/amenity_library2.glow.32.png"}
    })

	
	var cluster_strategy = new OpenLayers.Strategy.Cluster({distance: 15, threshold: 3});
	
    users_all = new OpenLayers.Layer.Vector("GeoJSON", {
        styleMap: sm,
        //renderers: renderer,
        projection: epsg4326,
        visibility: false,
        strategies: [new OpenLayers.Strategy.Fixed()],
        protocol: new OpenLayers.Protocol.HTTP({
            url: "users.json",
            format: new OpenLayers.Format.GeoJSON({extractAttributes: true})
        })
    });
    
    users = new OpenLayers.Layer.Vector("GeoJSON", {
        styleMap: sm,
        //renderers: renderer,
        projection: epsg4326,
        strategies: [new OpenLayers.Strategy.Fixed()],
        protocol: new OpenLayers.Protocol.HTTP({
            url: "users_active.json",
            format: new OpenLayers.Format.GeoJSON({extractAttributes: true})
        })
    });

    map.addLayers([lay_osm, users, users_all]);
    select = new OpenLayers.Control.SelectFeature(
        [users, users_all], {
            onSelect: onFeatureSelect,
            onUnselect: onFeatureUnselect
        }
    );

    highlight = new OpenLayers.Control.SelectFeature(
        [users, users_all], {
            hover: true,
            highlightOnly: true,
            eventListeners : {
                'featurehighlighted': function(e) {
                    var city = e.feature.attributes.city;
                    tooltip = new OpenLayers.Popup("chicken", 
                                 e.feature.geometry.getBounds().getCenterLonLat(),
                                 new OpenLayers.Size(70, 35),
                                 city,
                                 null, false);
                    e.feature.tooltip = tooltip;
                    tooltip.autoSize = true;
                    map.addPopup(tooltip);
                },
                'featureunhighlighted': function(e) {
                    if(e.feature.tooltip) {
                        map.removePopup(e.feature.tooltip);
                        e.feature.tooltip.destroy();
                        delete e.feature.tooltip;
                    }
                }
            }
        }
    );
    
    map.addControls([select, highlight, panel]);
    select.activate();
    map.setCenter(new OpenLayers.LonLat(lon, lat).transform(epsg4326, epsg900913), zoom);
}
function onPopupClose(evt) {
    select.unselectAll();
}
function onFeatureSelect(feature) {

    content = "";
    content += "Это: "+feature.attributes.city + "<br>";
    content += "Участников GIS-Lab: "+feature.attributes.count+"<br>";
    if (content.search("<script") != -1) {
        content = "Content contained Javascript! Escaped content below.<br>" + content.replace(/</g, "&lt;");
    }
    var ids = feature.attributes.userid;
    var names = feature.attributes.names;

    for (var i = 0; i < ids.length; i++) {
      content += "<a href=\"http://gis-lab.info/forum/memberlist.php?mode=viewprofile&u="+ids[i] + "\" target=\"_parent\">"+names[i]+"</a>, ";
    }
    
    content = content.substring(0,content.length-2);
    
    popup = new OpenLayers.Popup.Anchored("chicken", 
                             feature.geometry.getBounds().getCenterLonLat(),
                             new OpenLayers.Size(100,100),
                             content,
                             null, true, onPopupClose);
    popup.autoSize  = true;
    popup.keepInMap = true;
    feature.popup = popup;
    map.addPopup(popup);
}
function onFeatureUnselect(feature) {
    if(feature.popup) {
        map.removePopup(feature.popup);
        feature.popup.destroy();
        delete feature.popup;
    }
}
