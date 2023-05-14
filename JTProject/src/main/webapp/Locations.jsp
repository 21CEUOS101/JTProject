<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.min.css" integrity="sha512-...="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.7.1/leaflet.min.js" integrity="sha512-...="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="Locations.css" >
</head>
<body>
	
	<div id="mapid" style="height: 400px;"></div>
	<div>My Location :</div>
	<div id = "myloc"></div>
	<div id="locations"></div>
		
	<script>
    
        var mymap = L.map('mapid').setView([51.505, -0.09], 13);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/%22%3EOpenStreetMap</a> contributors',
            maxZoom: 18,
        }).addTo(mymap);
        
        var popup = L.popup();
        
        function onMapClick(e) {
        	popup
            .setLatLng(e.latlng)
            .setContent("You clicked the map at " + e.latlng.toString())
            .openOn(mymap);
        }

        mymap.on('click', onMapClick);

        var marker = L.marker([51.5, -0.09]).addTo(mymap);
        
        
        function onLocationFound(e) {
            var radius = e.accuracy / 2;

            marker.setLatLng(e.latlng).bindPopup("You are within " + radius + " meters from this point").openPopup();

            L.circle(e.latlng, radius).addTo(mymap);
            
            console.log("Latitude: " + e.latlng.lat + ", Longitude: " + e.latlng.lng);
            
            var location = document.getElementById("myloc");
            location.innerHTML = "Latitude: " + e.latlng.lat + ", Longitude: " + e.latlng.lng;
            
            
            var latitude = e.latlng.lat;
            var longitude = e.latlng.lng;
            var radius = 10000;
            var amenity = "${param.amenity}";
            var url = 'http://overpass-api.de/api/interpreter?data=[out:json];node[amenity='+ amenity +'](around:'+ radius +','+ latitude +','+ longitude +');out;';

            fetch(url)
              .then(response => response.json())
              .then(data => {
                // filter the data to only include elements with the specified amenity tag
                var filteredData = data.elements.filter(elem => elem.tags.amenity === amenity);
                
                // map the filtered data to an array of location objects with name, latitude, and longitude properties
                var locations = filteredData.map(loc => {
                  return {
                    name: loc.tags.name || '', // use empty string if name tag is missing
                    latitude: loc.lat,
                    longitude: loc.lon
                  }
                });
                
                var redIcon = L.icon({
                	  iconUrl: 'https://cdn.rawgit.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png',
                	  iconSize: [25, 41],
                	  iconAnchor: [12, 41],
                	  popupAnchor: [1, -34],
                	  shadowSize: [41, 41]
                	});e

                // create an HTML table to display the locations
               var table = '<table><thead><tr><th>Name</th><th>Latitude</th><th>Longitude</th></tr></thead><tbody id="locationsTable">';

				for (var i = 0; i < locations.length; i++) {
				    var marker = L.marker([locations[i].latitude, locations[i].longitude], { icon: redIcon }).addTo(mymap);
				    marker.bindPopup(locations[i].name);
				    table += '<tr><td>' + locations[i].name + '</td><td>' + locations[i].latitude + '</td><td>' + locations[i].longitude + '</td><td>';
				    
				}
				table += '</tbody></table>';
					


                
                // display the table on the page
                document.getElementById("locations").innerHTML = table;
              })
              .catch(error => {
                console.error('Error:', error);
              });
            

            
        }

        function onLocationError(e) {
            alert(e.message);
        }

        mymap.on('locationfound', onLocationFound);
        mymap.on('locationerror', onLocationError);

        mymap.locate({setView: true, maxZoom: 16});
        
        
        
    </script>
    
	<form method="post" action="/addLocation_diff">
		  <label for="row">Row number:</label>
		  <input type="text" name="row" id="row"><br><br>
		  <input type="submit" value="Submit">
	</form>
	
	<script>
	  // add event listener to the form submit event
	  document.querySelector('form').addEventListener('submit', function(event) {
	    event.preventDefault(); // prevent the form from submitting normally
	    
	    // get the row number input value
	    var rowNumber = document.getElementById('row').value;
	    
	    // find the corresponding row in the table and extract the data
	    var table = document.querySelector('table');
	    var rows = table.querySelectorAll('tr');
	    var row = rows[rowNumber];
	    var cells = row.querySelectorAll('td');
	    var amenity = "${param.amenity}";
	    var name = cells[0].textContent;
	    var latitude = parseFloat(cells[1].textContent.trim());
	    var longitude = parseFloat(cells[2].textContent.trim());
	    
	    console.log(table + " " + latitude + " " + longitude);
	    
	    // check if latitude and longitude are valid numbers
	    if (isNaN(parseFloat(latitude)) || isNaN(parseFloat(longitude))) {
	      alert('Latitude and longitude must be valid numbers');
	      return;
	    }
	    
	    // create a hidden form with the location data
	    var hiddenForm = document.createElement('form');
	    hiddenForm.style.display = 'none';
	    hiddenForm.method = 'post';
	    hiddenForm.action = '/addLocation';
	    
	    var amenityInput = document.createElement('input');
	    amenityInput.type = 'text';
	    amenityInput.name = 'amenity';
	    amenityInput.value = amenity;
	    hiddenForm.appendChild(amenityInput);
	    
	    var nameInput = document.createElement('input');
	    nameInput.type = 'text';
	    nameInput.name = 'name';
	    nameInput.value = name;
	    hiddenForm.appendChild(nameInput);
	    
	    var latitudeInput = document.createElement('input');
	    latitudeInput.type = 'number';
	    latitudeInput.name = 'latitude';
	    latitudeInput.value = latitude;
	    hiddenForm.appendChild(latitudeInput);
	    
	    var longitudeInput = document.createElement('input');
	    longitudeInput.type = 'number';
	    longitudeInput.name = 'longitude';
	    longitudeInput.value = longitude;
	    hiddenForm.appendChild(longitudeInput);
	    
	    // submit the hidden form
	    document.body.appendChild(hiddenForm);
	    hiddenForm.submit();
	  });
	</script>


    
</body>
</html>
	


    
</body>
</html>