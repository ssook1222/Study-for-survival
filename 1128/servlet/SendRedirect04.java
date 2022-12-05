package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/SendRedirect04")
public class SendRedirect04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SendRedirect04() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SendRedirect04 start");
		System.out.println( request.getParameter("txt1") );
		response.getWriter().print("HELLO!!!");
		response.sendRedirect("./SendRedirect042");
		System.out.println("SendRedirect04 end");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
