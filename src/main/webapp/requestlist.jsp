<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request List</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            background-image: url('back3.jpg'); 
            background-size: cover;
        }

        .content {
        	
            max-width: 800px;
            margin: 100px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .topic {
            text-align: center;
            margin-bottom: 20px;
        }

        h1 {
            color: #333;
        }

        a {
            text-decoration: none;
        }

        
        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
            border-radius: 5px;
        }

        button:hover {
            background-color: #0056b3;
        }


        .card {
            background-color: rgba(255, 255, 255, 0.8); 
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        label {
            font-weight: bold;
        }

        .buttons {
            margin-top: 10px;
        }

        .buttons a {
            margin-right: 10px;
        }

        .separator {
            height: 1px;
            background-color: #ddd;
            margin: 20px 0;
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

<%
        String staffMemberId = (String) session.getAttribute("staffMemberId");
		String fullname = (String) session.getAttribute("fullname");
		String Uname = (String) session.getAttribute("Uname");

        if (staffMemberId == null) {
            response.sendRedirect("login.jsp");
        } 
%>


<div class="menu-bar">
    <div class="user-profile-buttons">
        <img class="logo" alt="" src="logo.png">
        <h1 class="stopic">Staff Master</h1>
        <button class="menu-button" onclick="location.href='allrequests?mid=${staffMemberId}'">View All Requests</button>
        <button class="menu-button" onclick="">Complain !</button>
        <button class="menu-button" onclick="">Notices</button>
        <button class="menu-button" onclick="location.href='toprofile?smid=${Uname}'">Cancel</button>
        <button class="menu-button" onclick="location.href='logout'">Logout</button>
    </div>
</div>


    <div class="content">
        <div class="topic">
            <h1>Request List</h1>
            <a href="request.jsp"><button>Create New Request</button></a>
        </div>
        <div class="separator"></div>
        <c:forEach var="request" items="${reqlist}">
            <c:set var="id" value="${request.id}" />
            <c:set var="name" value="${request.staffName}" />
            <c:set var="smid" value="${request.staffId}" />
            <c:set var="leavetype" value="${request.leaveType}" />
            <c:set var="startdate" value="${request.startDate}" />
            <c:set var="enddate" value="${request.endDate}" />
            <c:set var="reason" value="${request.reason}" />
            <div class="card">
                <center><h2>Leave Request ID: ${request.id}</h2></center>
                <p><label>Staff Member Name:</label> ${request.staffName}</p>
                <p><label>Staff Member ID:</label> ${request.staffId}</p>
                <p><label>Leave Type:</label> ${request.leaveType}</p>
                <p><label>Start Date:</label> ${request.startDate}</p>
                <p><label>End Date:</label> ${request.endDate}</p>
                <p><label>Reason:</label> ${request.reason}</p>
                <c:url value="updaterequest.jsp" var="upreq">
                    <c:param name="id" value="${id}" />
                    <c:param name="name" value="${name}" />
                    <c:param name="smid" value="${smid}" />
                    <c:param name="leavetype" value="${leavetype}" />
                    <c:param name="startdate" value="${startdate}" />
                    <c:param name="enddate" value="${enddate}" />
                    <c:param name="reason" value="${reason}" />
                </c:url>
                <c:url value="deleterequest.jsp" var="delreq">
                    <c:param name="id" value="${id}" />
                    <c:param name="name" value="${name}" />
                    <c:param name="smid" value="${smid}" />
                    <c:param name="leavetype" value="${leavetype}" />
                    <c:param name="startdate" value="${startdate}" />
                    <c:param name="enddate" value="${enddate}" />
                    <c:param name="reason" value="${reason}" />
                </c:url>
                <div class="buttons">
                    <a href="${upreq}"><button>Update</button></a>
                    <a href="${delreq}"><button>Delete</button></a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
