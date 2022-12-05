package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/SendRedirect042")
public class SendRedirect042 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SendRedirect042() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SendRedirect042 start");
		System.out.println( request.getParameter("txt1") );
		response.getWriter().print("<h1>BYE~~~</h1>");
		System.out.println("SendRedirect042 end");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
