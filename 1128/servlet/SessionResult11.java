package servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servlet/SessionResult11")
public class SessionResult11 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SessionResult11() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessionObj = request.getSession();
		response.getWriter().print( sessionObj.getAttribute("login_id") );
		System.out.println( sessionObj.getCreationTime() );
		System.out.println( sessionObj.getLastAccessedTime() );
		System.out.println( sessionObj.getMaxInactiveInterval() );

		Enumeration<String> enumer = sessionObj.getAttributeNames();
		while( enumer.hasMoreElements() ) {
			String tmpStr = enumer.nextElement();
			System.out.print( tmpStr + " : " );
			System.out.println( sessionObj.getAttribute( tmpStr ) );
		}//while
	}//get

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
