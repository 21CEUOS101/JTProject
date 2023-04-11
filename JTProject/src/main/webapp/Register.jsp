<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Register.css">
</head>
<body>

			<script>
			    var message = "${msg}";
			    if (message) {
			        alert(message);
			        return;
			    }
			</script>
			
			
	<h1>Registration Form</h1>
    <form action="register-after" method="post">
	  <label for="fname">First Name:*</label>
	  <input type="text" id="fname" name="fname" required pattern="[A-Za-z]{2,}" title="Please enter a valid First Name"><br>
	
	  <label for="mname">Middle Name:</label>
	  <input type="text" id="mname" name="mname"><br>
	
	  <label for="lname">Last Name:*</label>
	  <input type="text" id="lname" name="lname" required pattern="[A-Za-z]{2,}" title="Please enter a valid Last Name"><br>
	
	  <label for="email_id">Email:*</label>
	  <input type="email" id="email_id" name="email_id" required><br>
	
	  <label for="mobile_no">Mobile No:*</label>
	  <input type="tel" id="mobile_no" name="mobile_no" required pattern="[0-9]{10}" title="Please enter a valid 10 digit mobile number"><br>
	
	  <label for="password">Password:*</label>
	  <input type="password" id="password" name="password" required minlength="8"><br>
	
	  <label for="verify-password">Verify Password:*</label>
	  <input type="password" id="verify-password" name="verify-password" required minlength="8"><br><br>
	
	  <input type="submit" value="Submit">
	</form>
	
</body>
</html>
