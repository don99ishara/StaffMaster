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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Budget Details</title>

<style>
html, body {
	height: 100%;
	text-align: center;
	color: #fff;
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

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #fff;
	width: 150px;
}

th {
	text-align: left;
}

thead {th { background-color:#55608f;
	
}

}
tbody {tr { &:hover {
			background-color : rgba(255, 255, 255, 0.3);
	
}

}
td {
	position: relative; &: hover { & : before { 
				 content : "";
	position: absolute;
	left: 0;
	right: 0;
	top: -9999px;
	bottom: -9999px;
	background-color: rgba(255, 255, 255, 0.2);
	z-index: -1;
}

}
}
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

</style>

</head>



<div class="menu-bar">
	<div class="user-profile-buttons">
		<img class="logo" alt="" src="logo.png">
		<button class="menu-button" onclick="location.href='toprofile?smid=${Uname}'">Back</button>
	</div>
</div>



<body>
    <br><br><br><br>
	<h1>budget details</h1>

	<table border="1">
		<tr>
			<th>Budget ID</th>
			<th>Department ID</th>
			<th>Budget Title</th>
			<th>Budget Description</th>
			<th>Budget Amount</th>
			<th>Currency Type</th>
			<th>Date Created</th>
			<th></th>
		</tr>

		<c:forEach var="budget" items="${bd}">
			<tr>
				<td>${budget.budgetID}</td>
				<td>${budget.deptID}</td>
				<td>${budget.title}</td>
				<td>${budget.description}</td>
				<td>${budget.amount}0</td>
				<td>${budget.currencyType}</td>
				<td>${budget.date}</td>
				<td><c:url value="deleteBudget.jsp" var="deleteBudget">
						<c:param name="bid" value="${budget.budgetID}" />
						<c:param name="did" value="${budget.deptID}" />
						<c:param name="title" value="${budget.title}" />
						<c:param name="des" value="${budget.description}" />
						<c:param name="amount" value="${budget.amount}" />
						<c:param name="currtype" value="${budget.currencyType}" />
						<c:param name="date" value="${budget.date}" />
					</c:url> <a href="${deleteBudget}"> <input class="button-5"
						type="button" name="deletebudget" value="Delete">
				</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<br><br>
	<a href="budgetinsert.jsp"><button class="button-5" onclick="">Insert New Budget</button></a>
	
</body>
</html>