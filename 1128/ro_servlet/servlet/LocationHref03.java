package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/LocationHref03")
public class LocationHref03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LocationHref03() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LocationHref03 start");
		PrintWriter out = response.getWriter();
		out.print("<body>");
		out.print("<h1>HELLO!!!</h1>");
		out.print("<script>location.href='http://www.naver.com/'</script>");
		out.print("</body>");
		out.close();
		System.out.println("LocationHref03 end");
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
