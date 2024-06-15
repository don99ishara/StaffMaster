package notices;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReadNoticeServlet")
public class ReadNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

        List<notices> notices = noticesDBUtil.getAllNotices(); 


        request.setAttribute("notices", notices);


        request.getRequestDispatcher("readNotices.jsp").forward(request, response);
    }
	}  


