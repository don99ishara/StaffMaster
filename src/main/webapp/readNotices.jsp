<%
        String staffMemberId = (String) session.getAttribute("staffMemberId");
		String fname = request.getParameter("firstname");   

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
    <title>All Notices</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 80px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
        }

        h1 {
            color: #007BFF;
        }

        .notice-card {
        
            position: relative;
            background: #fff;
            border: 1px solid #007BFF;
            border-radius: 10px;
            margin: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            cursor:pointer;
            transition: transform 0.2s;
        }
        
          .notice-card:hover {
            transform: scale(1.05);
        }

        .notice-title {
            font-size: 18px;
            color: #007BFF;
        }

        .notice-content {
            font-size: 16px;
            color: #333;
        }

        .notice-date {
            font-size: 14px;
            color: #777;
        }

        .notice-card:hover .buttons {
            display:block;
        }

        .buttons {
            display:none;
            position: absolute;
            bottom: 10px;
            right: 10px;
        }

        .buttons a {
            text-decoration: none; /* Remove underlining from the anchor */
        }

        .buttons button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
            cursor: pointer;
            transition: transform 0.2s;
            font-weight: bold;
        }

        .buttons button:hover {
            transform: scale(1.05);
            background-color: #0056b3;
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



    <div class="container">
        <h1>Notices</h1>

        <c:forEach items="${notices}" var="notice">
            <c:set var="id" value="${notice.id}" />
            <c:set var="title" value="${notice.title}" />
            <c:set var="date" value="${notice.date}" />
            <c:set var="author" value="${notice.author}" />
            <c:set var="content" value="${notice.content}" />

            <div class="notice-card">
                <h2 class="notice-title">${notice.title}</h2>
                <p class="notice-content">${notice.content}</p>
                <p class="notice-date">Date: ${notice.date}</p>
                <p class="notice-date">Author: ${notice.author}</p>

                <!-- Buttons for each notice -->
                <div class="buttons">
                    <a href="<c:url value='updateNotice.jsp' />?id=${id}&title=${title}&date=${date}&author=${author}&content=${content}">
                        <button>Update</button>
                    </a>
                    <a href="<c:url value='deletenotice.jsp' />?id=${id}&title=${title}&date=${date}&author=${author}&content=${content}">
                        <button>Delete</button>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
