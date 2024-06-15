<%
        String staffMemberId = (String) session.getAttribute("staffMemberId");
		String fname = request.getParameter("firstname");   
		String fullname = (String) session.getAttribute("fullname");

        if (staffMemberId == null) {
            response.sendRedirect("login.jsp");
        }
%>



<!DOCTYPE html>
<html>
<head>
    <title>Create Notice</title>
    
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
    
        <form action="createnotice" method="post" onsubmit="return validateForm()">
            <h1>Create Notice</h1>
            
            
                <label for="title">Notice Title:</label>
                <input class="fname" type="text" name="title" id="title" placeholder="Notice Title">
                <label for="date">Notice Date:</label>
                <input type="date" name="date" id="date" placeholder="Date">
                <label for="author">Author's Name:</label>
                <input type="text" name="author" id="author" placeholder="Author" value="<%=fullname%>" readonly>
            
            <label for="content">Notice Content:</label>
                <textarea name="content" id="content" rows="4" cols="50"></textarea>
            
            <center>
            <input type="submit" value="Add Notice">
            </center>
        </form>
        
        <script>
    function validateForm() {
        var title = document.getElementById("title");
        var date = document.getElementById("date");
        var author = document.getElementById("author");
        var content = document.getElementById("content");

        if (title.value.trim() === "") {
            alert("Please enter a Notice Title.");
            return false;
        }

        if (date.value.trim() === "") {
            alert("Please enter a Notice Date.");
            return false;
        }

        if (author.value.trim() === "") {
            alert("Please enter the Author's Name.");
            return false;
        }

        if (content.value.trim() === "") {
            alert("Please enter Notice Content.");
            return false;
        }

        return true;
    }
</script>
    
</body>
</html>