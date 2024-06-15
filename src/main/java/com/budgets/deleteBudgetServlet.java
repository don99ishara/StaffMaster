package com.budgets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.searchmember.staffmember;
import com.searchmember.staffmemberDButil;


@WebServlet("/deleteBudgetServlet")
public class deleteBudgetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bid = request.getParameter("bid");

		boolean istrue;

		istrue=budgetDBUtil.deletebudget(bid);

		if(istrue==true) {
			
			List<budget> bd = budgetDBUtil.getbudgetdetails();
			request.setAttribute("bd", bd);
			
			
			
			RequestDispatcher dis1 = request.getRequestDispatcher("displayBudget.jsp");
			dis1.forward(request, response);
		}

		else {
			
			List<budget> bd = budgetDBUtil.getbudgetdetails();
			request.setAttribute("bd", bd);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("displayBudget.jsp");
			dis2.forward(request, response);
		}


	}

}
