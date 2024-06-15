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
 * Servlet implementation class StaffUpdate
 */
@WebServlet("/StaffUpdate")
public class StaffUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String nic = request.getParameter("nic");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String mobile = request.getParameter("phone");
		String address = request.getParameter("address");
		String position = request.getParameter("position");
		String dept = request.getParameter("department");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
boolean isTrue;
		
		isTrue = UpdateStaffUtil.UpdateStaff(id,fname, lname, nic, dob, email, mobile, address, position, dept, username, password);
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
