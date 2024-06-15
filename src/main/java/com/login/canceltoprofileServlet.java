package com.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/canceltoprofileServlet")
public class canceltoprofileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
String uname = request.getParameter("smid");


		Staffdetailsutil stf = new Staffdetailsutil();
		List<StaffDetails> staffList = stf.getDetails(uname);
		
		
		if (!staffList.isEmpty()) {

			String position = staffList.get(0).getPosition();
			String Uname = staffList.get(0).getUsername();
			
			Staffdetailsutil stf2 = new Staffdetailsutil();
			List<StaffDetails> staff = stf2.getDetails(uname);
			request.setAttribute("staff",staff);

			if(position.equals("payroll")) {

				RequestDispatcher dis1 = request.getRequestDispatcher("payrollprofile.jsp");
				dis1.forward(request, response);
			}
			else if(position.equals("manager")) {

				RequestDispatcher dis1 = request.getRequestDispatcher("managerprofile.jsp");
				dis1.forward(request, response);
			}
			else if(position.equals("admin")) {

				RequestDispatcher dis1 = request.getRequestDispatcher("adminprofile.jsp");
				dis1.forward(request, response);
			}
			else {

				RequestDispatcher dis1 = request.getRequestDispatcher("profile.jsp");
				dis1.forward(request, response);

			}


		}
	}

}
