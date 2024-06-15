<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%
        String staffMemberId = (String) session.getAttribute("staffMemberId");
		String fullname = (String) session.getAttribute("fullname");
		String Uname = (String) session.getAttribute("Uname");

        if (staffMemberId == null) {
            response.sendRedirect("login.jsp");
        } 
    %>
    
    
    
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Leave Request Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: url('back3.jpg') center/cover no-repeat;
	margin: 0;
}


h1 {
	text-align: center;
}

form {
	background-color: rgba(255, 255, 255, 0.8);
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	text-align: left;
	padding-right: 50px;
	margin: 80px auto;
}

label {
	display: block;
	margin-top: 10px;
}

input[type="text"], input[type="date"], select, textarea {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

select {
	height: 40px;
}

textarea {
	resize: none;
}

input[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}


 /*       menu     */
        
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
        
        .topic {
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
        <h1 class="topic">Staff Master</h1>
        <button class="menu-button" onclick="location.href='allrequests?mid=${staffMemberId}'">View All Requests</button>
        <button class="menu-button" onclick="">Complain !</button>
        <button class="menu-button" onclick="">Notices</button>
        <button class="menu-button" onclick="location.href='logout'">Logout</button>
    </div>
</div>





		


	<form action="create" method="post" onsubmit="return validateForm()">
    <h1>Request a Leave</h1>
    <label for="employee_name">Staff Member Name:</label>
    <input type="text" id="employee_name" name="employee_name" value="<%=fullname%>" readonly>
    <label for="employee_id">Staff Member ID:</label>
    <input type="text" id="employee_id" name="employee_id" value="<%=staffMemberId %>" readonly required>
    <label for="leave_type">Leave Type:</label>
    <select id="leave_type" name="leave_type" required>
        <option value="vacation">Vacation</option>
        <option value="sick">Sick Leave</option>
        <option value="personal">Personal Leave</option>
    </select>
    <label for="start_date">Start Date:</label>
    <input type="date" id="start_date" name="start_date" required>
    <label for="end_date">End Date:</label>
    <input type="date" id="end_date" name="end_date" required>
    <label for="reason">Reason for Leave:</label>
    <textarea id="reason" name="reason" rows="4" ></textarea>
    <input type="hidden" name="uname" value="${username}">
    <center><div id="error-message" style="color: red;"></div></center>
    <input type="submit" value="Submit Request">
</form>

<script>
    function validateForm() {
    	
    	var reason = document.getElementById('reason').value;
        var startDate = new Date(document.getElementById("start_date").value);
        var endDate = new Date(document.getElementById("end_date").value);
        var errorMessage = document.getElementById('error-message');

        if (startDate > endDate) {
        	errorMessage.textContent = 'End Date must be Greater than Start Date';
            return false;
        }
        
        
        if(reason == ''){
        	errorMessage.textContent = 'Please Enter A Valid Reason !';
        	return false;
        }
        return true; 
    }
</script>
	
	

	
</body>
</html>
