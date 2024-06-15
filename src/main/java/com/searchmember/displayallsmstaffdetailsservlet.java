package com.searchmember;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/displayallsmstaffdetailsservlet")
public class displayallsmstaffdetailsservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		staffmemberDButil s = new staffmemberDButil();
		
		List<staffmember> smembers = s.getstaffmemberdetails();
		
		request.setAttribute("smembers", smembers);
		
		request.getRequestDispatcher("/selectemployee.jsp").forward(request, response);
		
		
		
	}

}


