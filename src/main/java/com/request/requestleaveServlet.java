package com.request;

import java.io.IOException;
import java.sql.Date;
import java.util.List; // Import List from java.util

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/requestleaveServlet")
public class requestleaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String employeeName = request.getParameter("employee_name");
        String employeeId = request.getParameter("employee_id");
        String leaveType = request.getParameter("leave_type");
        Date startDate = Date.valueOf(request.getParameter("start_date"));
        Date endDate = Date.valueOf(request.getParameter("end_date"));
        String reason = request.getParameter("reason");

        boolean isTrue;
        isTrue = requestUtil.createLeaveRequest(employeeName, employeeId, leaveType, startDate, endDate, reason);

        if (isTrue) {
        	

            requestUtil r = new requestUtil();

            requestUtil req = new requestUtil();
            List<request> reqlist = r.getDetails(employeeId);

            request.setAttribute("reqlist", reqlist);

            
            request.getRequestDispatcher("/requestlist.jsp").forward(request, response);
           
            
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}


