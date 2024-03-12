GDownloadUrl(pntfilename, function(data, responseCode) {
	var aLat = "LATITUDE";
	var aLong = "LONGITUDE";
	var aDate = "UTC_DATE";
	
	var xml = GXml.parse(data);
	var markers = xml.documentElement.getElementsByTagName("marker");
	document.open();
	document.writeln('<table border="1">');
	//document.writeln('<tr>');
	document.writeln('<th>Date<\/th>');
	document.writeln('<th># points<\/th>');
	document.writeln('<th>Distance,km<\/th>');
	//document.writeln('<\/tr>');
	
	var i = 0;
	while (i < markers.length - 1) {
		var totaldist = 0;
		var num = 0;
		var date = markers[i].getAttribute(aDate);
		var date2 = markers[i].getAttribute(aDate);
		while (date == date2) {
			var num = num + 1;
			var lat1 = parseFloat(markers[i].getAttribute(aLat));
			var lon1 = parseFloat(markers[i].getAttribute(aLong));
			var lat2 = parseFloat(markers[i+1].getAttribute(aLat));
			var lon2 = parseFloat(markers[i+1].getAttribute(aLong));
			var adist = CalcDist(lat1,lat2,lon1,lon2);
			var totaldist = totaldist + adist;
			var i=i+1;
			if (i > markers.length - 2) {
				var date2 = 2020;
			}
			else {
				var date2 = markers[i].getAttribute(aDate);
			}
		}
		document.writeln('<tr>');
		document.writeln('<td>'+date+'<\/td>');
		document.writeln('<td>'+num+'<\/td>');
		document.writeln('<td>'+totaldist.toFixed(2)+'<\/td>');
		document.writeln('<\/tr>');
	}
	document.writeln('</table>');
	document.close();	
});


/* extend Number object with methods for converting degrees/radians */
Number.prototype.toRad = function() { return this * Math.PI / 180; }  // convert degrees to radians

function CalcDist(lat1,lat2,lon1,lon2)
{
	var R = 6371; // km
	var dLat = (lat2-lat1).toRad();
	var dLon = (lon2-lon1).toRad();
	var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * Math.sin(dLon/2) * Math.sin(dLon/2);
	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	var d = R * c;
	return d;
}
	

