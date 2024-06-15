package com.request;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/displayrequestsServlet")
public class displayrequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String mid = request.getParameter("mid");

        requestUtil r = new requestUtil();


        List<request> reqlist = r.getDetails(mid);


        request.setAttribute("reqlist", reqlist);


        request.getRequestDispatcher("/requestlist.jsp").forward(request, response);
    }
}
