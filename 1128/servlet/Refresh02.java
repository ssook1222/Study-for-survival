package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/Refresh02")
public class Refresh02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Refresh02() {
        super();
    }//constructor

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=== Refresh02 start ===");
		response.addHeader("refresh", "5;url='http://www.naver.com/'");
		response.getWriter().print("<h1>Refresh02 Complete!!!</h1>");
		System.out.println("=== Refresh02 end ===");
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}//doPost

}//class
