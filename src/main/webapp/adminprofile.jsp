<%
        String staffMemberId = (String) session.getAttribute("staffMemberId");
		String fullname = (String) session.getAttribute("fullname");
		String Uname = (String) session.getAttribute("Uname");

        if (staffMemberId == null) {
            response.sendRedirect("login.jsp");
        } 
%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Member Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('back3.jpg') center/cover no-repeat;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #007BFF;
            margin-top: 20px;
        }


        .employee-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            font-family: Lucida Sans;
        }

        .employee-card {
            background-color: #fff;
            border: 1px solid #007BFF;
            border-radius: 5px;
            padding: 40px;
            margin: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 600px;
            margin-top:100px;
        }

        .employee-info {
            margin: 10px 0;
        }

        .employee-info label {
            font-weight: bold;
            color: #007BFF;
        }

        .employee-info p {
            margin: 0;
            color: #555;
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
        
        .stopic {
 			position: absolute;
 			top: -7px;
  			left: 625px;
  			z-index: 7;
 			color: white; 
  			font-family: cursive; 
		}
    </style>
</head>
<body>

		



<div class="menu-bar">
    <div class="user-profile-buttons">
        <img class="logo" alt="" src="logo.png">
        <h1 class="stopic">Staff Master</h1>
        <button class="menu-button" onclick="location.href='Registration.jsp'">Add Staff</button>
        <button class="menu-button" onclick="location.href='view'">Manage Staff</button>
        <button class="menu-button" onclick="location.href='toprofile?smid=${Uname}'">Profile</button>
        <button class="menu-button" onclick="location.href='logout'">Logout</button>
    </div>
</div>


<div class="employee-container">
    <c:forEach var="s" items="${staff}">
        <div class="employee-card">
        	<h1>Staff Member Details</h1>
            <img class="propic" alt="" src="software-engineer.png">
            <div class="employee-info">
                <label>First Name:</label>
                ${s.fname}
            </div>
            <div class="employee-info">
                <label>Last Name:</label>
                ${s.lname}
            </div>
            <div class="employee-info">
                <label>NIC:</label>
                ${s.NIC}
            </div>
            <div class="employee-info">
                <label>Date of Birth:</label>
                ${s.dob}
            </div>
            <div class="employee-info">
                <label>Email:</label>
                ${s.email}
            </div>
            <div class="employee-info">
                <label>Mobile:</label>
                ${s.mobile}
            </div>
            <div class="employee-info">
                <label>Address:</label>
                ${s.address}
            </div>
            <div class="employee-info">
                <label>Position:</label>
                ${s.position}
            </div>
            <div class="employee-info">
                <label>Department:</label>
                ${s.department}
            </div>
            <div class="employee-info">
                <label>Username:</label>
                ${s.username}
            </div>
            <div class="employee-info">
                <label>Password:</label>
                ${s.password}
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>






