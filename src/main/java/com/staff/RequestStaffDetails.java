package com.staff;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RequestStaffDetails")
public class RequestStaffDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDataUtil rd = new RequestDataUtil();
		
		List <StaffDetails> sdetail = rd.getDetails();

		request.setAttribute("sdetails", sdetail);
		
		request.getRequestDispatcher("StaffDetails.jsp").forward(request, response);
		
	}

}
