<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.project.JTProject.model.Locations" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Locations</title>
	<link rel="stylesheet" href="BookMarks.css">
</head>
<body>
	<h1>Locations</h1>
	
	<form action="addLocation" method="post">
		<p>
			<label for="amenity">Amenity:</label>
			<input type="text" id="amenity" name="amenity" required>
		</p>
		<p>
			<label for="name">Name:</label>
			<input type="text" id="name" name="name" required>
		</p>
		<p>
			<label for="longitude">Longitude:</label>
			<input type="number" step="any" id="longitude" name="longitude" required>
		</p>
		<p>
			<label for="latitude">Latitude:</label>
			<input type="number" step="any" id="latitude" name="latitude" required>
		</p>
		<p>
			<input type="submit" value="Add Location">
		</p>
	</form>
	<%-- 
	${locations}
	<p>Locations: ${locations}</p> --%>
	
	<%-- <% List<Locations> locations = (List<Locations>) request.getAttribute("locations");
	for (Locations location : locations) { %>
	    <p>Name: <%= location.getName() %></p>
	    <p>Longitude: <%= location.getLogitude() %></p>
	    <p>Latitude: <%= location.getLatitude() %></p>
	    <p>Amenity: <%= location.getAmenity() %></p>
	<% } %> --%>
	
		<style>
			.locations-container {
			  display: flex;
			  flex-direction: column;
			  align-items: center;
			  margin-top: 20px;
			}
			
			.location-item {
			  display: flex;
			  flex-direction: column;
			  align-items: flex-start;
			  margin-bottom: 20px;
			  padding: 10px;
			  border: 1px solid #ccc;
			  border-radius: 5px;
			  width: 300px;
			}
			
			.location-item h2 {
			  margin: 0;
			}
			
			.location-item p {
			  margin: 0;
			  font-size: 16px;
			}
		</style>
		
		<div class="locations-container">
		  <% List<Locations> locations = (List<Locations>) request.getAttribute("locations");
		  for (Locations location : locations) { %>
		    <div class="location-item">
		      <h2><%= location.getName() %></h2>
		      <p>Longitude: <%= location.getLogitude() %></p>
		      <p>Latitude: <%= location.getLatitude() %></p>
		      <p>Amenity: <%= location.getAmenity() %></p>
		    </div>
		  <% } %>
		</div>
	
	
	
	<form method="POST" action="/deleteLocation">
	    <input type="number" name="lid">
	    <input type="submit" value="Delete">
	</form>
	
	
	
</body>
</html>
