/*
var map;
var tooltip;
var globalMarkers;
var globalMarkersInfo;
*/

var baseIcon;
var treeIcon;

function assign_map(control_id, lon, lat, zoom, is_small)
{
    map = new GMap2(document.getElementById(control_id));
    
    map.getMapTypes().length = 0;
    
    var tileIFL= new GTileLayer(new GCopyrightCollection(""),1,17);
    tileIFL.myLayers='WMS';
    tileIFL.myFormat='image/png';
    tileIFL.myBaseURL='http://gis-lab.info/cgi-bin/wmsopenifl?';
    tileIFL.getTileUrl=CustomGetTileUrl;
    
    tileIFL.getOpacity = function() {return 0.7;}
    
    var layer=[G_NORMAL_MAP.getTileLayers()[0], tileIFL]; 
    var G_NORMAL_MAP_IFL = new GMapType(layer, G_NORMAL_MAP.getProjection(), "IFL-Map", G_NORMAL_MAP);
    map.addMapType(G_NORMAL_MAP_IFL);
    
    var layer=[G_PHYSICAL_MAP.getTileLayers()[0], tileIFL]; 
    var G_PHYSICAL_MAP_IFL = new GMapType(layer, G_SATELLITE_MAP.getProjection(), "IFL-Topo", G_PHYSICAL_MAP);
    map.addMapType(G_PHYSICAL_MAP_IFL);

    var layer=[G_SATELLITE_MAP.getTileLayers()[0], tileIFL]; 
    var G_SATELLITE_MAP_IFL = new GMapType(layer, G_SATELLITE_MAP.getProjection(), "IFL-Space", G_SATELLITE_MAP);
    map.addMapType(G_SATELLITE_MAP_IFL);

    if(is_small) map.addControl(new GSmallMapControl()); else map.addControl(new GLargeMapControl());
    map.addControl(new GMapTypeControl());
    map.addControl(new GScaleControl());
    map.setCenter(new GLatLng(lon, lat), zoom, G_NORMAL_MAP_IFL);
    
    baseIcon = new GIcon();
    baseIcon.shadow = "http://www.google.com/mapfiles/shadow50.png";
    baseIcon.iconSize = new GSize(20, 34);
    baseIcon.shadowSize = new GSize(37, 34);
    baseIcon.iconAnchor = new GPoint(9, 34);
    baseIcon.infoWindowAnchor = new GPoint(9, 2);
    baseIcon.infoShadowAnchor = new GPoint(18, 25);
    
    treeIcon = new GIcon(baseIcon);
    treeIcon.image = "skin/markerTree.png";
    
    return map;
}

function initialize(control_id)
{
    if(!GBrowserIsCompatible()) return;
/*
    if(navigator.appName == "Microsoft Internet Explorer")
        document.getElementById('body').onload = function() { init_map(); }
    else
*/
    init_map(); 
}

