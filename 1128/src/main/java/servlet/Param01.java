package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/Param01")
public class Param01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Param01() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println( request.getParameter("name") );
		System.out.println( request.getParameter("pwd") );
		System.out.println( request.getParameter("hid_txt") );
		System.out.println( request.getParameter("gender") );
		System.out.println( request.getParameter("sel1") );
		System.out.println( Arrays.toString( request.getParameterValues("sports") ) );

		PrintWriter out = response.getWriter();
		out.print("<h1>success~~</h1>");

		Enumeration<String> enumer = request.getParameterNames();
		while(enumer.hasMoreElements()) {
			out.print("<h1>" + enumer.nextElement() + "</h1>");
		}//while

		out.close();//close
	}//get

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}//class








