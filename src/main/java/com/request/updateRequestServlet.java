package com.request;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateRequestServlet")
public class updateRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String id = request.getParameter("request_id");
		String name = request.getParameter("employee_name");
		String mid = request.getParameter("employee_id");
		String leavetype = request.getParameter("leave_type");
		Date startdate = Date.valueOf(request.getParameter("start_date"));
		Date enddate = Date.valueOf(request.getParameter("end_date"));
		String reason = request.getParameter("reason");
		
		boolean isTrue;
		
		isTrue = requestUtil.UpdateRequest(id, name, mid, leavetype, startdate, enddate, reason);
		
		if(isTrue == true) {
			
			requestUtil req = new requestUtil();
			List<request> reqlist = req.getDetails(mid);
			request.setAttribute("reqlist", reqlist);
			
			RequestDispatcher dis = request.getRequestDispatcher("requestlist.jsp");
			dis.forward(request, response);
			
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
		
	}

}
