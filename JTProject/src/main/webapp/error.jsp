<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Error Page</title>
	<link rel="stylesheet" href="error.css">
</head>
<body>
	<h1>Error Page</h1>
	<p>An error has occurred. Please try again later.</p>
	<p>Error details: <%if (exception != null) {String errorMessage = exception.getMessage();} else {}%></p>
</body>
</html>
