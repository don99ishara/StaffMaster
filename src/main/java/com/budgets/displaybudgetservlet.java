package com.budgets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/displaybudgetservlet")
public class displaybudgetservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		budgetDBUtil b = new budgetDBUtil();

		List<budget> bd = b.getbudgetdetails();

		request.setAttribute("bd", bd);

		request.getRequestDispatcher("/displayBudget.jsp").forward(request, response);
	}

}
