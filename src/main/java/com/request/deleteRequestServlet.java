package com.request;

import java.io.IOException;
import java.util.List;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteRequestServlet")
public class deleteRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("request_id");
		String mid = request.getParameter("employee_id");
		boolean isTrue;
		
		isTrue = requestUtil.DeleteRequest(id);
		
		if(isTrue==true) {
			
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
