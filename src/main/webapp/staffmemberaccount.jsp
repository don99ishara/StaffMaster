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
<title>Staff member details</title>

<style>
body, html {
	height: 100%;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #D9AFD9;
	background-image: linear-gradient(0deg, #D9AFD9 0%, #97D9E1 100%);
	text-align: center;
	padding: 20px;
	margin: 0;
}

h2 {
	color: #fff; 
}

table {
	background-color: #222; 
	border: 1px solid #444; 
	width: 50%;
	margin: 0 auto;
	border-radius: 5px;
	text-align: left; 
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
	height: 30%; 
}

td {
    padding: 10px;
    color: #fff; 
    text-align: left;
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



.button-5 {
	align-items: center;
	background-clip: padding-box;
	background-color: #fa6400;
	border: 1px solid transparent;
	border-radius: .25rem;
	box-shadow: rgba(0, 0, 0, 0.02) 0 1px 3px 0;
	box-sizing: border-box;
	color: #fff;
	cursor: pointer;
	display: inline-flex;
	font-family: system-ui, -apple-system, system-ui, "Helvetica Neue",
		Helvetica, Arial, sans-serif;
	font-size: 16px;
	font-weight: 600;
	justify-content: center;
	line-height: 1.25;
	margin: 0;
	min-height: 3rem;
	padding: calc(.875rem - 1px) calc(1.5rem - 1px);
	position: relative;
	text-decoration: none;
	transition: all 250ms;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	vertical-align: baseline;
	width: auto;
}

.button-5:hover, .button-5:focus {
	background-color: #fb8332;
	box-shadow: rgba(0, 0, 0, 0.1) 0 4px 12px;
}

.button-5:hover {
	transform: translateY(-1px);
}

.button-5:active {
	background-color: #c85000;
	box-shadow: rgba(0, 0, 0, .06) 0 2px 4px;
	transform: translateY(0);
}
</style>


</head>


<div class="menu-bar">
	<div class="user-profile-buttons">
		<img class="logo" alt="" src="logo.png">
		<button class="menu-button" onclick="location.href='toprofile?smid=${Uname}'">Back</button>
	</div>
</div>



<body>

	<h2>payroll manager viewing staff member details</h2>

	<% if (request.getAttribute("isValidID") != null && !(boolean) request.getAttribute("isValidID")) { %>
        <h2 style="color: #fff;">Invalid Staff Member ID</h2>
    <% } else { %>
	

	<table>
		<c:forEach var="sm" items="${smdetails}">

			<c:set var="id" value="${sm.id}" />
			<c:set var="name" value="${sm.name}" />
			<c:set var="salary" value="${sm.basicsalary}" />

			<tr>
				<td>staff member ID :</td>
				<td>${sm.id}</td>
			</tr>

			<tr>
				<td>Staff member name :</td>
				<td>${sm.name}</td>
			</tr>

			<tr>
				<td>Basic salary :</td>
				<td>${sm.basicsalary}</td>
			</tr>

			<tr>
				<td>Phone number :</td>
				<td>${sm.phone}</td>
			</tr>

			<tr>
				<td>Address :</td>
				<td>${sm.address}</td>
			</tr>

		</c:forEach>

	</table>


	<c:url value="updatesalary.jsp" var="salaryupdate">
		<c:param name="id" value="${id}" />
		<c:param name="name" value="${name}" />
		<c:param name="salary" value="${salary}" />
	</c:url>
	<br>
	<a href="${salaryupdate}"> <input class="button-5" type="button"
name="update" value="Update Salary">
	</a>
	<% } %>