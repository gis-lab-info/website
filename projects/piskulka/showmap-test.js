    //<![CDATA[

    function load() {
      if (GBrowserIsCompatible()) {
        var map = new GMap2(document.getElementById("map"));
        map.addControl(new GLargeMapControl());
        map.addControl(new GMapTypeControl());
		map.addControl(new GScaleControl());
		
		var icon = new GIcon();
		icon.image = "/images/google-marker.png";
		icon.iconSize = new GSize(12, 12);
		icon.iconAnchor = new GPoint(6, 3);
		icon.infoWindowAnchor = new GPoint(5, 1);
		
		var arrowIcon = new GIcon();
      	arrowIcon.iconSize = new GSize(24,24);
      	arrowIcon.shadowSize = new GSize(1,1);
      	arrowIcon.iconAnchor = new GPoint(12,12);
      	arrowIcon.infoWindowAnchor = new GPoint(0,0);
		
		var degreesPerRadian = 180.0 / Math.PI;
		GEvent.addListener(map, "zoomend", function() {
  			alert("«умирование");
		  });
		
  	function createMarker(point,date) {
        var marker = new GMarker(point,icon);
		if (date != null) {
        GEvent.addListener(marker, "click", function() {
          marker.openInfoWindowHtml(date);
        });
		}
        return marker;
      }
      
	  function bearing( from, to ) {
        // See T. Vincenty, Survey Review, 23, No 176, p 88-93,1975.
        // Convert to radians.
        var lat1 = from.latRadians();
        var lon1 = from.lngRadians();
        var lat2 = to.latRadians();
        var lon2 = to.lngRadians();

        // Compute the angle.
        var angle = - Math.atan2( Math.sin( lon1 - lon2 ) * Math.cos( lat2 ), Math.cos( lat1 ) * Math.sin( lat2 ) - Math.sin( lat1 ) * Math.cos( lat2 ) * Math.cos( lon1 - lon2 ) );
        if ( angle < 0.0 )
	 	angle  += Math.PI * 2.0;

        // And convert result to degrees.
        angle = angle * degreesPerRadian;
        angle = angle.toFixed(1);
        return angle;
      }
		     
      // === A function to put arrow heads at intermediate points
      function midArrows(points) {
        for (var i=1; i < points.length-1; i++) {  
          var p1=points[i];
          var p2=points[i+1];
          var dir = bearing(p1,p2);
          // == round it to a multiple of 3 and cast out 120s
          var dir = Math.round(dir/3) * 3;
          while (dir >= 120) {dir -= 120;}
          // == use the corresponding triangle marker 
          arrowIcon.image = "http://www.google.com/intl/en_ALL/mapfiles/dir_"+dir+".png";
		  var midx = p1.x+((p2.x-p1.x)/2);
		  var midy = p1.y+((p2.y-p1.y)/2);
		  var middlepoint = new GLatLng(midy, midx);
		  map.addOverlay(new GMarker(middlepoint, arrowIcon));
        }
      }
		
        GDownloadUrl(filename, function(data) {
		  var xml = GXml.parse(data);
          var markers = xml.documentElement.getElementsByTagName("marker");
		  var numpoints = markers.length - 1;
          var points = [];
		  var dates = [];
		  var lc = [];
		  for (var i = 0; i < markers.length; i++) {
            var point = new GLatLng(parseFloat(markers[i].getAttribute("lat")),
                                    parseFloat(markers[i].getAttribute("lng")));
			var adate = markers[i].getAttribute("date");
			var alc = markers[i].getAttribute("lc");
			dates.push(adate);
			points.push(point);
			lc.push(alc);
          }
		  var points2 = points.slice();
		  points2.sort(function(p1, p2) {
  		  return p1.lng() - p2.lng();
		  });
		  var west = points2[0].x;
		  var east = points2[numpoints].x;
		  points2.sort(function(p1, p2) {
  		  return p1.lat() - p2.lat();
		  });
		  var north = points2[numpoints].y;
		  var south = points2[0].y;
		  var sw = new GLatLng(south,west);
		  var ne = new GLatLng(north,east);
		  var bounds = new GLatLngBounds(sw, ne);
		  var centerpoint = new GLatLng((north + south)/2, (east + west)/2);
		  var zoomlevel = map.getBoundsZoomLevel(bounds);
		  map.setCenter(centerpoint, zoomlevel, G_SATELLITE_MAP);
		  midArrows(points);
		  for (var i = 0; i < (numpoints + 1); i++) {
		  	var text = dates[i] + lc[i];
		  	var marker = createMarker(points[i], text);
			map.addOverlay(marker);
		  }
		  	map.addOverlay(new GPolyline(points));
        });
      }
    }
    //]]>