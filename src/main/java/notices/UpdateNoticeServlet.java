package notices;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notices.notices;
import notices.noticesDBUtil;

@WebServlet("/updateNoticeServlet")
public class UpdateNoticeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String dateStr = request.getParameter("date");
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	Date date = null;

    	try {
    	    date = new Date(dateFormat.parse(dateStr).getTime());
    	} catch (ParseException e) {
    	    e.printStackTrace();
    	}

    	String id = request.getParameter("id"); 
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	String author = request.getParameter("author");

        boolean isTrue;

isTrue = noticesDBUtil.updateNotice(id, title, content, date, author);
		
		if(isTrue == true)
		{
			
			List<notices> notices = noticesDBUtil.getAllNotices(); 

	        
	        request.setAttribute("notices", notices);

	        
	        request.getRequestDispatcher("readNotices.jsp").forward(request, response);
		}
		else 
		{
			noticesDBUtil n = new noticesDBUtil();
			List<notices> notices = n.getDetails(id);
			request.setAttribute("notices", notices);
			
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
    }
}

