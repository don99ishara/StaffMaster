package com.budgets;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/budgetInsert")
public class budgetInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String budgetID = request.getParameter("BudgetID");
		String deptID = request.getParameter("DepartmentID");
		String title = request.getParameter("title");
		String description = request.getParameter("Description");
		String amount = request.getParameter("amount");
		String currencyType = request.getParameter("Currency");
		Date date = Date.valueOf(request.getParameter("date"));
		String notes = request.getParameter("Notes");
		
		
		boolean isTrue;
		
		isTrue = budgetDBUtil.insertBudget(budgetID, deptID, title, description, amount, currencyType, date, notes);
		
		if(isTrue == true) {
			
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
