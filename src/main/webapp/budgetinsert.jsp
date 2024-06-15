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
<title>Insert New Budget</title>

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

form {
	background-color: #222; 
	border: 1px solid #444;
	padding: 20px;
	width: 300px;
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
    margin-bottom: 3px; 
    color: #fff; 
}

input[type="text"],
input[type="date"],
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 5px; 
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
</style>


</head>
<body>
	<form action="insertBudget" method="post">

		<label for="BudgetID">Budget ID : </label> <input type="text"
			name="BudgetID" required oninput="validateSize(this, 10); validateAlphanumeric(this)"><br>
		<label for="DepartmentID">Department ID : </label> <input
			type="text" name="DepartmentID" required oninput="validateSize(this, 10); validateAlphanumeric(this)"><br>
		<label for="Title">Title : </label> <input type="text"
			name="title" required><br>
		<label for="Description">Description : </label> <input
			type="text" name="Description" required><br>
		<label for="Amount">Allocation Amount : </label> <input
			type="text" name="amount" required oninput="validateAmount(this)"><br>
		<label for="Currency">Currency Type : </label> <select
			name="Currency" required>
			<option value="USD">US Dollar (USD)</option>
			<option value="LKR">Sri Lankan Rupee (LKR)</option>
		</select><br>
		<label for="Date">Date:</label> <input type="date"
			name="date" required>
		<br> <input class="button-5" type="submit" name="submit"
			value="Create Budget">
	</form>
	<br>
	<a href="disbudget"><button class="button-5" onclick="">Cancel</button></a>
	
	
	  <script>
	  
	  
	  function validateSize(input, maxLength) {
	      if (input.value.length > maxLength) {
	        input.value = input.value.slice(0, maxLength);
	        alert('Input should not exceed ' + maxLength + ' characters.');
	      }
	    }

	    function validateAlphanumeric(input) {
	      var validInput = /^[A-Za-z0-9]*$/;
	      if (!validInput.test(input.value)) {
	    	  input.value = '';
	        alert('Please enter alphanumeric characters only.');
	      }
	    }
	  
	  
    function validateAmount(input) {
      
      var validInput = /^\d*\.?\d*$/;

      if (!validInput.test(input.value)) {
        input.value = '';
        alert('Please enter a valid number for Allocation Amount.');
      }
    }
  </script>
	
	
	
</body>
</html>