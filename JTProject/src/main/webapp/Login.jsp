<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Login.css">
</head>
<body>
        	<script>
			    var message = "${ID}";
			    if (message!=null) {
			        alert("Your User Id : "+message);
			    }
			    
			    
			</script>
	<div class="container">
      <div class="login-container">
        <form action="login-after" method="post" class="login">
		  <h1 class="title">Login</h1>
		  <label for="username">Username:*</label>
		  <input type="text" placeholder="Enter Username" name="username" id="username" required><br>
		
		  <label for="uid">UserId:*</label>
		  <input type="text" placeholder="Enter UserId" name="uid" id="uid" required><br>
		
		  <label for="password">Password:*</label>
		  <input type="password" placeholder="Enter Password" name="password" id="password" required><br>
		
		  <button type="submit">Login</button>
		  <p>Forgot Password?</p>
		</form>
		
      </div>
    </div>
</body>
</html>
