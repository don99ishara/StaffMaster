package notices;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/createNoticeServlet")
public class createNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date datee = Date.valueOf(request.getParameter("date"));
		String author = request.getParameter("author");

     
		boolean isTrue;

		isTrue = noticesDBUtil.createnotice(title,content,datee,author) ;

		if(isTrue == true) {

			
			List<notices> notices = noticesDBUtil.getAllNotices(); 

			
			request.setAttribute("notices", notices);

			
			request.getRequestDispatcher("readNotices.jsp").forward(request, response);




		}
		else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);

		}


	}

}
