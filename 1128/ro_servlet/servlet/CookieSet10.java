package servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CookieSet10")
public class CookieSet10 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CookieSet10() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie coo1 = new Cookie("test1"
				, URLEncoder.encode("simple cookie test", "UTF-8") );//띄어쓰기는 엔코딩 처리
		coo1.setMaxAge(60 * 60 * 24);//-1:즉시 종료, 0:즉시 삭제, 60초 * 60분 * 24시간 = 하루
		response.addCookie(coo1);

		Cookie coo2 = new Cookie("test2", "한글");
		response.addCookie(coo2);

		response.sendRedirect("./CookieGet10");
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}//class










