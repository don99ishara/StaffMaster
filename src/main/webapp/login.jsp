<!DOCTYPE html>
<html>
<head>
    <style>
    
         body, ul, html {
            margin: 0;
            padding: 0;
            height: 100%; 
        }


        .top-menu {
            background-color: #007BFF; 
            overflow: hidden;
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            height: 50px; 
            position: fixed; 
            top: 0; 
            width: 100%; 
            z-index: 1; 
        }


        .logo {
            padding: 0 20px;
        }

     
        .logo img {
            height: 30px; 
        }

        
        .top-menu li {
            list-style: none; 
        }

        .top-menu li a {
            display: block; 
            color: white; 
            text-align: center;
            padding: 14px 16px; 
            text-decoration: none; 
            transition: background-color 0.3s; 
        }

        
        .top-menu li a:hover {
            background-color: #555;
            transform: scale(1.05); 
        }

       
        .top-menu li {
            opacity: 0;
            animation: fadeIn 1s ease forwards;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-10px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        
        .search-form {
            background-color: rgba(255, 255, 255, 0.2); 
            border-radius: 20px; 
            padding: 10px; 
            backdrop-filter: blur(10px); 
            margin: 0 20px; 
        }

        .search-form input[type="text"] {
            background: transparent; 
            border: none; 
            color: white;
            width: 150px; 
        }

        .search-form button {
            background-color: transparent; 
            border: none;
            cursor: pointer;
        }

        
        .login-container {
            position: relative; 
        }

        
        .background-image {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            filter: blur(10px); 
            z-index: -1; 
        }

        
        .login-box {
            background-color: #f2f2f2; 
            width: 300px; 
            padding: 20px; 
            border-radius: 10px; 
            text-align: center;
            position: absolute; 
            top: 200px; 
            right: 200px; 
            padding-right: 45px;
        	background-color: rgba(255, 255, 255, 0.7); 
        	backdrop-filter: blur(5px);
        }

        .login-box h2 {
            color: #333; 
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%; 
            padding: 10px; 
            margin: 10px 0; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
        }

        .login-box button {
            background-color: #007BFF; 
            color: white; 
            padding: 10px 20px; 
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-box button:hover {
            background-color: #555; 
        }

        
        .footer {
            background-color: #007BFF;
            color: white;
            text-align: center;
            padding: 10px;
        }

        
        .custom-sentence {
            position: absolute;
            left: 80px; 
            top: 190px; 
            color: #ffffff; 
            font-size: 20px; 
            font-family: 'Arial', sans-serif; 
        }


        @keyframes blink {
            0%, 100% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
        }

        
        .custom-sentence p:last-child {
            animation: blink 2s infinite; 
        }
    </style>
</head>
<body style="background-image: url('back3.jpg'); background-size: cover; background-position: center; background-attachment: fixed;">
    <ul class="top-menu">
        <li class="logo"><a href="#"><img src="logo.png" alt="Logo"></a></li>
        <li><a href="#home">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Services</a></li>
        <li><a href="#contact">Contact</a></li>
        <li class="search-form">
            <input type="text" placeholder="Search">
            <button>Search</button>
        </li>
    </ul>

    <div class="login-container">
        <div class="background-image"></div>
        <div class="login-box">
            <h2>Login</h2>
            
            <form action="login" method="post" onsubmit="return validateForm()">
    			<input type="text" placeholder="Username" name="uname" id="username">
    			<input type="password" placeholder="Password" name="pwd" id="password">
    			<button type="submit" id="loginButton">Login</button>
    			<div id="error-message" style="color: red;"></div>
			</form>
            
            
            
            
        </div>
        
        
        <div class="custom-sentence">
            <p style="font-size: 75px;">Welcome to Staff Master</p> 
            <p style="font-size: 50px;"> Please login to continue.</p>
        </div>
    </div>

    
    <div style="height: 668px">
       
    </div>

    <div class="footer">
        &copy; 2023 Your Website. All Rights Reserved.
    </div>
    
    <script>
    function validateForm() {
        const usernameInput = document.getElementById('username');
        const passwordInput = document.getElementById('password');
        const errorMessage = document.getElementById('error-message');
        
        
        const username = usernameInput.value;
        const password = passwordInput.value;

        if (username.trim() === '' && password.trim() === '') {
            errorMessage.textContent = 'Username and password are required fields.';
            return false; 
        }
        else if(username.trim() === ''){
        	errorMessage.textContent = 'Please Enter a Valid Username';
            return false; 
        }
        else if(password.trim() === ''){
        	errorMessage.textContent = 'Please Enter a Valid Password';
            return false; 
        }		

        return true;
    }

    </script>
    
</body>
</html>
