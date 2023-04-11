<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
  <head>
    <title>My Project Home Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }

      header {
        background-color: #333;
        color: white;
        padding: 20px;
        text-align: center;
      }

      section {
		  margin: 20px;
		  margin-bottom: 60px; 
		}


		footer {
		  background-color: #333;
		  color: white;
		  padding: 10px;
		  text-align: center;
		  position: fixed;
		  bottom: 0;
		  width: 100%;
		}


		      
		a {
		  color: var(--discord-blue);
		  text-decoration: none;
		}
		
		a:hover {
		  text-decoration: underline;
		}
		
		button {
		  background-color: var(--discord-blue);
		  border: none;
		  border-radius: 4px;
		  color: var(--discord-text);
		  cursor: pointer;
		  font-size: 16px;
		  margin: 10px;
		  padding: 10px 20px;
		  transition: background-color 0.3s ease;
		}
		
		button:hover {
		  background-color: var(--discord-light);
		}
		
		.navbar {
		  background-color: var(--discord-blue);
		  display: flex;
		  justify-content: space-between;
		  padding: 10px;
		}
		
		.navbar a {
		  color: var(--discord-text);
		  font-size: 18px;
		  margin: 0 10px;
		}
		
		.navbar a:hover {
		  text-decoration: underline;
		}
		.login-btn {
		  background-color: transparent;
		  border: 2px solid var(--discord-text);
		  color: var(--discord-text);
		  font-size: 16px;
		  margin: 10px;
		  padding: 10px 20px;
		  transition: background-color 0.3s ease, color 0.3s ease;
		}
		
		.login-btn:hover {
		  background-color: var(--discord-light);
		  color: var(--discord-text);
		}
		
		.register-btn {
		  background-color: transparent;
		  border: 2px solid var(--discord-text);
		  color: var(--discord-text);
		  font-size: 16px;
		  margin: 10px;
		  padding: 10px 20px;
		  transition: background-color 0.3s ease, color 0.3s ease;
		}
		
		.register-btn:hover {
		  background-color: var(--discord-light);
		  color: var(--discord-text);
		}

      .description {
        font-size: 20px;
        text-align: center;
        margin-top: 20px;
      }

      .image {
        display: block;
        margin: 0 auto;
        max-width: 100%;
        height: auto;
        margin-top: 20px;
		        height: 400px;
		  border-radius: 10px;
		  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
      }
    </style>
  </head>
  <body>
  
  	<div class="navbar">
    <div class="navbar-right">
      <button class="login-btn" onclick="location.href='/login'">Log In</button>
      <button class="register-btn" onclick="location.href='/register'">Register</button>
    </div>
  </div>
    <header>
      <h1>Welcome to My Project</h1>
    </header>
    <section>
      <h2>About</h2>
      <p class="description">
        This is a web application that allows users to find the nearest amenities, such as parking places, restaurants, and gas stations.
      </p>
      <img src="WORLD MAP.jpeg" alt="Project Image" class="image">
    </section>
    <footer>
      <p>&copy; 2023 My Project. All rights reserved.</p>
    </footer>
    
  </body>
</html>
 