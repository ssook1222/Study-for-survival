package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Forward052")
public class Forward052 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Forward052() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Forward052 start");
		System.out.println( request.getParameter("txt1") );
		System.out.println( request.getAttribute("data 공유1") );

		response.getWriter().print("<h1>Forward052</h1>");
		System.out.println("Forward052 end");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
