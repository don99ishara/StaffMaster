<%
        String staffMemberId = (String) session.getAttribute("staffMemberId");
		String fullname = (String) session.getAttribute("fullname");
		String Uname = (String) session.getAttribute("Uname");
		
		if (staffMemberId == null) {
            response.sendRedirect("login.jsp");
        } 

%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Member Search</title>
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

form {
	background-color: #222; 
	border: 1px solid #444; 
	padding: 20px;
	width: 500px;
	margin: 0 auto;
	border-radius: 5px;
	text-align: left; 
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); 
	border-color: transparent; 
	transition: border-color 0.3s; 
	display: flex;
	flex-direction: column;
	align-items: center; 
}

form:hover {
	border-color: #FFA500; 
}

label {
	display: block;
	margin-bottom: 5px;
	color: #fff; 
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #444; 
	border-radius: 5px;
	background-color: #333; 
	color: #fff; 
	padding: 5px;
	
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
	text-align: left;
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
	z-index: -1;
}

}
}
}
</style>
</head>




<div class="menu-bar">
	<div class="user-profile-buttons">
		<img class="logo" alt="" src="logo.png">
			<button class="menu-button" onclick="location.href='toprofile?smid=${Uname}'">Cancel</button>
		
	</div>
</div>

<div class="content">
	<h2>Staff Member Search</h2>

	<form action="searchmember" method="post">
		<br> <label for="staffmemberid">Enter a staff member ID</label> <br>
		<input type="text" name="staffmemid"
			placeholder="Enter staff member ID" required> <br> <input
			class="button-5" type="submit" name="submit" value="Search Member">
		<br>
	</form>
</div>

<div>
<br><br>

<table border="1">
		<tr>
			<th>ID</th>
			<th>name</th>
			<th>basic sal</th>
			<th>phone</th>
			<th>address</th>
		</tr>

		<c:forEach var="sm" items="${smembers}">
			<tr>
				<td>${sm.id}</td>
				<td>${sm.name}</td>
				<td>${sm.basicsalary}</td>
				<td>${sm.phone}</td>
				<td>${sm.address}</td>
			</tr>
		</c:forEach>
	</table>


</div>
</html>