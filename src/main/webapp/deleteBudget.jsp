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
<title>Delete Budgets</title>


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
  font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
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

.button-5:hover,
.button-5:focus {
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

label {
    display: block;
    margin-bottom: 3px;
    color: #fff; 
}

	
	
</style>



</head>



<body>
  <%
      String bid = request.getParameter("bid");
      String did = request.getParameter("did");
      String title =request.getParameter("title");
      String des = request.getParameter("des");
      String amount = request.getParameter("amount");
      String currtype = request.getParameter("currtype");
      String date = request.getParameter("date");
  %>
  
  
  <form action="deletebudget" method="post">
    
    <label>Budget ID :</label> <input type="text" name="bid" value="<%=bid%>" readonly> <br>
    <label>Department ID   : </label><input type="text" name="did" value="<%=did%>" readonly> <br>
    <label>Title :</label>  <input type="text" name="title" value="<%=title%>" readonly> <br>
    <label>Description :</label> <input type="text" name="des" value="<%=des%>" readonly> <br>
    <label>Amount :</label> <input type="text" name="amount" value="<%=amount%>" readonly> <br>
    <label>Currency Type :</label> <input type="text" name="currtype" value="<%=currtype%>" readonly> <br>
    <label>Date :</label> <input type="text" name="date" value="<%=date%>" readonly> <br>
    
    <input class="button-5" type="submit" name="submit" value="Delete Budget">
    
    </form>
    
    <br>
    <a href="disbudget"><button class="button-5" onclick="">Cancel</button></a>
  

</body>
</html>