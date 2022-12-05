package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/Include06")
public class Include06 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Include06() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Include06 start");
		System.out.println( request.getParameter("txt1") );

		RequestDispatcher disp = request.getRequestDispatcher("/Include062");
		disp.include(request, response);

		response.getWriter().print("<h1>0606060606</h1>");
		System.out.println("Include06 end");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
