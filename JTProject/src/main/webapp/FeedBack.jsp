<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.project.JTProject.model.FeedBack" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Form</title>
<link rel="stylesheet" href="FeedBack.css">
</head>
<body>

	<form method="POST" action="/addFeedback">
	    <label for="feedback">Feedback:</label>
	    <textarea id="feedback" name="feedback"></textarea>
	    <br>
	    <input type="submit" value="Submit">
	</form>
	
	<%-- ${feedbacks} --%>
	
	<style>
	    .feedback-container {
	        display: flex;
			  flex-direction: column;
			  align-items: center;
			  margin-top: 20px;
	    }
	    .feedback-item {
			  display: flex;
			  flex-direction: column;
			  align-items: flex-start;
			  margin-bottom: 20px;
			  padding: 10px;
			  border: 1px solid #ccc;
			  border-radius: 5px;
			  width: 300px;
			}
			
	    .feedback-container p {
	        margin: 5px 0;
	    }
	</style>
	<div class="feedback-container">
	<% List<FeedBack> feedbacks = (List<FeedBack>) request.getAttribute("feedbacks");
	   for (FeedBack feedback : feedbacks) { %>
	    <div class="feedback-item">
	        <p><%= feedback.getId() %></p>
	        <p><%= feedback.getFeedback() %></p>
	        <p><%= feedback.getDate() %></p>
	    </div>
	<% } %>
	</div>
		
	
	<form method="POST" action="/updateFeedback">
	    <label for="review">Review:</label>
	    <textarea id="review" name="feedback"></textarea>
	    <input type="number" name="fid"> 
	    <br>
	    <input type="submit" value="Update Review">
	</form>
	
	
	<form method="POST" action="/deleteFeedback">
	    <input type="number" name="fid">
	    <input type="submit" value="Delete Review">
	</form>
	
</body>
</html>
