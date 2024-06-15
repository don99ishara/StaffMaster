<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Member Search</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	color: #fff; /* Text color */
	text-align: center;
	padding: 20px;
	margin: 0;
}

h2 {
	color: #fff; /* Heading color */
}

form {
	background-color: #222; /* Dark gray background */
	border: 1px solid #444; /* Light gray border */
	padding: 20px;
	width: 300px;
	margin: 0 auto;
	border-radius: 5px;
	text-align: left; /* Left-align the form content */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); /* Add a subtle shadow */
	border-color: transparent; /* Make the initial border transparent */
	transition: border-color 0.3s; /* Smooth border color transition */
	display: flex;
	flex-direction: column;
	align-items: center; /* Center items horizontally */
}

form:hover {
	border-color: #FFA500; /* Orange border when hovering */
}

label {
	display: block;
	margin-bottom: 5px;
	color: #fff; /* Text color */
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #444; /* Dark gray border */
	border-radius: 5px;
	background-color: #333; /* Dark input field background */
	color: #fff; /* Text color */
	padding: 5px;
	/* Add padding to create space between input and border */
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
	<h2>Staff Member Search</h2>
	<br>
	<br>

	<form action="searchmember" method="post">
		<label for="staffmemberid">Enter a staff member ID</label> <input
			type="text" name="staffmemid" placeholder="Enter staff member ID"
			required> <input class="button-5" type="submit" name="submit"
			value="Search Employee">
	</form>
</body>
</html>
