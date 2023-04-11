<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JT Project</title>
  <link rel="stylesheet" href="Home.css">
</head>
<body>

  <div class="main-section">
    <h1>Find Nearby Amenities</h1>
    <p>Enter your location and select the category of amenity you're interested in:</p>
    <button onclick="location.href='/locations?amenity=parking'">Find Parking</button>
	<button onclick="location.href='/locations?amenity=restaurant'">Find Restaurants</button>
	<button onclick="location.href='/locations?amenity=school'">Find Schools</button>
	<button onclick="location.href='/locations?amenity=hospital'">Find Hospitals</button>
	<button onclick="location.href='/locations?amenity=bank'">Find Banks</button>
	<button onclick="location.href='/locations?amenity=library'">Find Libraries</button>
	<button onclick="location.href='/locations?amenity=post_office'">Find Post Offices</button>
	<button onclick="location.href='/locations?amenity=place_of_worship'">Find Temple</button>
	<button onclick="location.href='/locations?amenity=police'">Find Police Stations</button>
	
	
  </div>
  
  	<form method="GET" action="/getFeedbacks">
	  <button type="submit">Get Feedbacks</button>
	</form>
	
	<form method="GET" action="/getLocations">
	  <button type="submit">Get Locations</button>
	</form>
	
	<form method="POST" action="/deleteCustomer">
	  <button type="submit">Delete Customer</button>
	</form>

	
  

  <div class="description">
    <p>Our website helps you easily find nearby amenities. Simply enter your location and select the category of amenity you're interested in, and we'll provide you with a list of options. Whether you're looking for a place to park, a restaurant to dine at, or a school for your kids, we've got you covered. Try it out now!</p>
  </div>
</body>
</html>
