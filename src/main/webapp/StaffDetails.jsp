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
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="StaffDetails.css">
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
	
<title>Insert title here</title>
</head>
<body>
	<div class="menu-bar">
    <div class="user-profile-buttons">
        <img class="logo" alt="" src="logo.png">
        <button class="menu-button" onclick="location.href='Registration.jsp'">Add Staff</button>
        <button class="menu-button" onclick="location.href='view'">Manage Staff</button>
        <button class="menu-button" onclick="">profile</button>
        <button class="menu-button" onclick="location.href='logout'">Logout</button>
    </div>
</div>
    
	<h2>Employee Details</h2>
	
	
	<a href="Registration.jsp"><button class="edit-button" id="btn1">Add User</button></a>
    <table class="employee-details">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>NIC</th>
            <th>Date of Birth</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Address</th>
            <th>Position</th>
            <th>Department</th>
            <th>User name</th>
            <th>Action</th> <!-- New column for Edit and Delete buttons -->
        </tr>
	
	<c:forEach var ="staff" items = "${sdetails}">
	
		<c:set var="id" value="${staff.getStaffID()}"></c:set>
		<c:set var="fname" value="${staff.getFname()}"></c:set>
		<c:set var="lname" value="${staff.getLname()}"></c:set>
		<c:set var="nic" value="${staff.getNIC()}"></c:set>
		<c:set var="dob" value="${staff.getDob()}"></c:set>
		<c:set var="email" value="${staff.getEmail()}"></c:set>
		<c:set var="mobile" value="${staff.getMobile()}"></c:set>
		<c:set var="address" value="${staff.getAddress()}"></c:set>
		<c:set var="position" value="${staff.getPosition()}"></c:set>
		<c:set var="department" value="${staff.getDepartment()}"></c:set>
		<c:set var="username" value="${staff.getUsername()}"></c:set>
		<c:set var="password" value="${staff.getPassword()}"></c:set>
	
	
	
	
		<tr>
            <td>${staff.getStaffID()}</td>
            <td>${staff.getFname()}</td>
            <td>${staff.getLname()}</td>
            <td>${staff.getNIC()}</td>
            <td>${staff.getDob()}</td>
            <td>${staff.getEmail()}</td>
            <td>${staff.getMobile()}</td>
            <td>${staff.getAddress()}</td>
            <td>${staff.getPosition()}</td>
            <td>${staff.getDepartment()}</td>
            <td>${staff.getUsername()}</td>
            
         <c:url value="UpdateStaff.jsp" var="staffUpdate">
         	<c:param name="id" value="${id}"/>
         	<c:param name="fname" value="${fname}"/>
         	<c:param name="lname" value="${lname}"/>
         	<c:param name="nic" value="${nic}"/>
         	<c:param name="dob" value="${dob}"/>
         	<c:param name="email" value="${email}"/>
         	<c:param name="mobile" value="${mobile}"/>
         	<c:param name="address" value="${address}"/>
         	<c:param name="position" value="${position}"/>
         	<c:param name="department" value="${department}"/>
         	<c:param name="username" value="${username}"/>
         	<c:param name="password" value="${password}"/>
         </c:url>   
         
           <c:url value="DeleteStaff.jsp" var="staffdelete">
         	<c:param name="id" value="${id}"/>
         	<c:param name="fname" value="${fname}"/>
         	<c:param name="lname" value="${lname}"/>
         	<c:param name="nic" value="${nic}"/>
         	<c:param name="dob" value="${dob}"/>
         	<c:param name="email" value="${email}"/>
         	<c:param name="mobile" value="${mobile}"/>
         	<c:param name="address" value="${address}"/>
         	<c:param name="position" value="${position}"/>
         	<c:param name="department" value="${department}"/>
         	<c:param name="username" value="${username}"/>
         	<c:param name="password" value="${password}"/>
         </c:url>   
         
            
      		<td> 
      		<a href="${staffUpdate}">    
                <button class="edit-button">Edit</button>
                </a>
                <a href="${staffdelete}">
                <button class="delete-button">Delete</button>
                </a>
               </td>
            
        </tr>
	</c:forEach>
	</table>
</body>
</html>