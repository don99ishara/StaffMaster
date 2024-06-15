<%
        String staffMemberId = (String) session.getAttribute("staffMemberId");
		String fullname = (String) session.getAttribute("fullname");
		String Uname = (String) session.getAttribute("Uname");

        if (staffMemberId == null) {
            response.sendRedirect("login.jsp");
        } 
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Registration.css">
    <style>
	 .menu-bar {
            display: flex;
            justify-content: flex-end;
            background-color: #007BFF;
            padding: 10px;
            position: fixed;
    		top: 0;
    		left: 0;
    		width: 100%;
    		background-color: #007BFF;
    		padding: 10px;
    		z-index: 100;
        }

        .user-profile-buttons {
            display: flex;
            justify-content: flex-start;
            margin-left: 10px;
            margin-top: 10px;
        }

        .menu-button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            margin-right: 10px;
            cursor: pointer;
        }

        .menu-button:hover {
            background-color: #0056b3;
        }
        
        .logo {
            width: 60px;
            height: 50px;
            position: absolute;
            top: 10px;
            left: 50px;
        }

        .propic {
            height: 200px;
            width: 200px;
            margin-left: auto;
            margin-right: auto;
            display: block;
            border: 3px solid #007BFF;
            border-radius: 50%;
        }
     .head1{
     	margin-top:100px;
     }
</style>
    <title>Document</title>
</head>
<body>
	<script src="validation.js"></script>
		<body>
	<div class="menu-bar">
    <div class="user-profile-buttons">
        <img class="logo" alt="" src="logo.png">
        <button class="menu-button" onclick="location.href='Registration.jsp'">Add Staff</button>
        <button class="menu-button" onclick="location.href='view'">Manage Staff</button>
        <button class="menu-button" onclick="location.href='toprofile?smid=${Uname}'">Profile</button>
        <button class="menu-button" onclick="location.href='logout'">Logout</button>
    </div>
</div>
    <h2 class="head1">Staff Registration</h2>
    <form action="insertstaff" method="post">
    	
    	<label for="id">ID:</label>
        <input type="text" name="id" id="id" required><br><br>
    
        <label for="first_name">First Name:</label>
        <input type="text" name="fname" id="fname" required><br><br>

        <label for="last_name">Last Name:</label>
        <input type="text" name="lname" id="lname" required><br><br>

        <label for="nic">NIC number:</label>
        <input type="text" name="nic" id="NIC" oninput="nicCheck()" required><br>
         <p id="Vnic" style="color: red; visibility:hidden;">Enter a valid NIC number</p>
        

        <label for="dob">Date of Birth:</label>
        <input type="date" name="dob" id="dob" required><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" id="Email" oninput="emailCheck()" required><br>
        <p id="Vemail" style="color: red; visibility:hidden;">Enter a valid email address</p>
        

        <label for="phone">Phone:</label>
        <input type="tel" name="phone" id="phone" oninput="phoneCheck()" required><br>
        <p id="Pnumber" style="color: red; visibility:hidden;">Enter a valid phone number</p>
        <br>

        <label for="address">Address:</label>
        <textarea name="address" id="address" rows="4" required></textarea><br><br>

        <label for="position">position:</label>
        <select name="position" id="position">
            <option value="member">Staff Member</option>
            <option value="HR">HR Manager</option>
            <option value="Payrole">Payrole Manager</option>
            <option value="Staff">Staff Manager</option>
        </select>
        <br><br>
        <label for="department">Department:</label>
        <select name="department" id="department">
            <option value="HR">HR</option>
            <option value="Finance">Finance</option>
            <option value="IT">IT</option>
            <option value="Marketing">Marketing</option>
            <!-- Add more departments as needed -->
        </select><br><br>
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required><br>
        <p id="password" style="color: red; visibility:hidden;">Enter a valid password</p>
        

        <label for="confirm_password">Confirm Password:</label>
        <input type="password" name="confirm_password" id="cpw" oninput="passwordcheck()" required><br>
        <p id="confirmpassword" style="color: red; visibility:hidden;">Password does not match</p>
       

        <input type="submit" value="Register" id="submitbtn" >
    </form>
    <div style="margin-bottom: 50px;"></div>
</body>
</html>