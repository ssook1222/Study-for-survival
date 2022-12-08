package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CookieGet10")
public class CookieGet10 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CookieGet10() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie [] cookieArr = request.getCookies();
		for (Cookie cookie : cookieArr) {
			System.out.println(cookie.getMaxAge());
			System.out.println(cookie.getName());
			System.out.println(cookie.getValue());
		}//for
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}//class





