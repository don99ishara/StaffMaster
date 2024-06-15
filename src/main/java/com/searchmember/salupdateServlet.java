package com.searchmember;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/salupdateServlet")
public class salupdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String smid = request.getParameter("id");
		String salary = request.getParameter("sal");


		boolean istrue;

		istrue = staffmemberDButil.updatesalary(smid, salary);

		if(istrue == true ) {

			staffmemberDButil stf = new staffmemberDButil();
			List<staffmember> smdetails = stf.getDetails(smid);
			request.setAttribute("smdetails", smdetails);

			RequestDispatcher dis1 = request.getRequestDispatcher("staffmemberaccount.jsp");
			dis1.forward(request, response);
		}
		else {
			
			staffmemberDButil stf = new staffmemberDButil();
			List<staffmember> smdetails = stf.getDetails(smid);
			request.setAttribute("smdetails", smdetails);

			RequestDispatcher dis2 = request.getRequestDispatcher("staffmemberaccount.jsp");
			dis2.forward(request, response);
		}


	}

}
