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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</style>
</head>
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
	
	<%
	 String ID = request.getParameter("id");
	 String fname = request.getParameter("fname");
	 String lname = request.getParameter("lname");
	 String NIC = request.getParameter("nic");
	 String dob = request.getParameter("dob");
	 String email = request.getParameter("email");
	 String mobile = request.getParameter("mobile");
	 String address = request.getParameter("address");
	 String position = request.getParameter("position");
	 String department = request.getParameter("department");
	 String username = request.getParameter("username");
	 String password = request.getParameter("password");
	%>



	<h1>Delete Staff Details</h1>
	<h1>Delete Staff Details</h1>
	
	    <form action="staffdelete" method="post">
	    
	    <label for="id">ID:</label>
        <input type="text" name="id" id="id" value="<%=ID %>" readonly><br><br>
	    
        <label for="first_name">First Name:</label>
        <input type="text" name="fname" id="fname" value="<%=fname %>" readonly><br><br>

        <label for="last_name">Last Name:</label>
        <input type="text" name="lname" id="lname" value="<%=lname %>" readonly><br><br>

        <label for="nic">NIC number:</label>
        <input type="text" name="nic" id="nic" value="<%= NIC %>" readonly><br><br>

        <label for="dob">Date of Birth:</label>
        <input type="date" name="dob" id="dob" value="<%= dob %>" readonly><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="<%=email %>" readonly><br><br>

        <label for="phone">Phone:</label>
        <input type="tel" name="phone" id="phone" value="<%=mobile %>" readonly><br><br>

        <label for="address">Address:</label>
        <textarea name="address" id="address" rows="4" readonly><%=address %></textarea><br><br>

        <label for="position">position:</label>
        <select name="position" id="position" >
            <option value="member">Staff Member</option>
            <option value="HR">HR Manager</option>
            <option value="Payrole">Payrole Manager</option>
            <option value="Staff">Staff Manager</option>
        </select>
        <br><br>
        <label for="department">Department:</label>
        <select name="department" id="department" >
            <option value="HR">HR</option>
            <option value="Finance">Finance</option>
            <option value="IT">IT</option>
            <option value="Marketing">Marketing</option>
            <!-- Add more departments as needed -->
        </select><br><br>
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" value="<%=username %>" readonly><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" value="<%=password %>" readonly><br><br>
 

        <input type="submit" value="Delete">
    </form>
	
</body>
</html>