<cfoutput>

	<cfsaveContent variable="htmlText">
		<table class="googleTable"><tr><td><h1 style="padding:0 0 5px">The Elysian Resort</h1><br /><h3 class="googleH2">18 Saridewi, Seminyak, Kuta, Bali, Indonesia 80361</h3></td></tr></table>
	</cfsaveContent>

	<cfset htmlText = trim(htmlText) />

	<script src="http://maps.google.com/maps?file=api&v=2&key=#application.googleKey#" type="text/javascript"></script>
	<script type="text/javascript">

		//<![CDATA[

		var geocoder;
		var map;

		var address = "18 Saridewi, Seminyak, Kuta, Bali";

		// On page load, call this function

		function load()
		{
		   // Create new map object
		   map = new GMap2(document.getElementById("map"));
			// add large Map Control
			map.addControl(new GLargeMapControl());
			// add map/satellite toggle
			map.addControl(new GMapTypeControl());
			// add BRHS overview control
			map.addControl(new GOverviewMapControl());

		   // Create new geocoding object
		   geocoder = new GClientGeocoder();

		   // Retrieve location information, pass it to addToMap()
		   geocoder.getLocations(address, addToMap);
		}

		// This function adds the point to the map

		function addToMap(response)
		{

		   // Retrieve the object
		   place = response.Placemark[0];

		   // Retrieve the latitude and longitude
		   point = new GLatLng(place.Point.coordinates[1],
		                       place.Point.coordinates[0]);
		   //point = new GLatLng(-8.6799115,115.157653);

		   // Center the map on this point
		   map.setCenter(point, 13);

		   // Create a marker
		   marker = new GMarker(point);

		   // Add the marker to map
		   map.addOverlay(marker);

			//map.addControl(new google.maps.LocalSearch());
<!---

		var streetAddress = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.Thoroughfare.ThoroughfareName;
		var city = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.SubAdministrativeAreaName;
		var state = place.AddressDetails.Country.AdministrativeArea.AdministrativeAreaName;
		var zip = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.PostalCode.PostalCodeNumber;
 --->

		   // Add address information to marker
		  // marker.openInfoWindowHtml(place.address);
		   // Add address information to marker

			marker.openInfoWindowHtml('#htmlText#');

		}

		 //]]>
	</script>
</cfoutput>

<div id="map" style="width: 700px; height: 600px"></div>
