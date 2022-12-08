package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/Forward05")
public class Forward05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Forward05() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Forward05 start");
		System.out.println( request.getParameter("txt1") );
		request.setAttribute("data 공유1", "this is share data.");

		RequestDispatcher disp = request.getRequestDispatcher("/Forward052");
		disp.forward(request, response);

		response.getWriter().print("<h1>0505050505</h1>");
		System.out.println("Forward05 end");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
