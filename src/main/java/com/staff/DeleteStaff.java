package com.staff;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteStaff
 */
@WebServlet("/DeleteStaff")
public class DeleteStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		
		boolean isTrue;
		
		isTrue = DeleteStaffUtil.DeleteStaff(id);
		if(isTrue == true)
		{
			RequestDataUtil rd = new RequestDataUtil();
			List <StaffDetails> sdetail = rd.getDetails();
			request.setAttribute("sdetails", sdetail);
			request.getRequestDispatcher("StaffDetails.jsp").forward(request, response);
		}else
		{
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccesfull.jsp");
			dis2.forward(request, response);
		}
		
	}

}
