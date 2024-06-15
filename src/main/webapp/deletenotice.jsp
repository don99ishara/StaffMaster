<%
        String staffMemberId = (String) session.getAttribute("staffMemberId");
		String fname = request.getParameter("firstname");   

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
<title>Delete Notice</title>
   <style>
body {
	font-family: Arial, sans-serif;
	background: url('background.jpg') center/cover no-repeat;
	margin: 0;
}




h1 {
	text-align: center;
}

form {
	background-color: rgba(255, 255, 255, 0.8);
	max-width: 400px;
	margin: 80px auto;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	text-align: left;
	padding-right: 50px;

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
        
    .alert {
        background-color: #ff0000;
        color: #fff;
        position: fixed;
        top: 10px;
        left: 50%;
        transform: translateX(-50%);
        padding: 10px;
        border-radius: 5px;
        z-index: 9999;
         display: none; 
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
        <button class="menu-button" onclick="">Complain !</button>
        <button class="menu-button" onclick="">Notices</button>
        <button class="menu-button" onclick="location.href='toprofile?smid=${Uname}'">Cancel</button>
        <button class="menu-button" onclick="location.href='logout'">Logout</button>
    </div>
</div>
	<%
	String error = "";
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String date = request.getParameter("date");
	String author = request.getParameter("author");

	if (id == null || id.isEmpty() || !id.matches("\\d+")) {
		error = "Invalid Notice ID.";
	}
	%>
	<%
	if (!error.isEmpty()) {
	%>
	<div class="alert" style="display: block;">
		<p><%=error%></p>
	</div>
	<%
	} else {
	%>
	<div class="alert" style="display: none;">
		<p></p>
	</div>
	<%
	}
	%>



	<form action="deletenotice" method="post">

<h1>Delete Notice Form</h1>

<label for="id">Notice ID:</label>
<input type="text" id="id" name="id" value="<%=id%>" readonly>

<label for="title">Notice Title:</label>
<input type="text" id="title" name="title" value="<%=title%>" readonly>

<label for="date">Notice Date:</label>
<input type="text" id="date" name="date" value="<%=date%>" readonly>

<label for="author">Notice Author:</label>
<input type="text"id="author" name="author" value="<%=author%>" readonly>

<label for="content">Notice Content:</label>
<textarea  id="content" rows="4" cols="50" name="content" readonly><%=content%></textarea>



 <center><input type="submit" name="submit" value="Delete Notice"></center>


</form>

</body>
</html>
