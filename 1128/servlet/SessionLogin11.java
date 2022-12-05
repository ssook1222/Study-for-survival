package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/servlet/SessionLogin11")
public class SessionLogin11 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SessionLogin11() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}//doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idFromView = request.getParameter("mid");
		String pwdFromView = request.getParameter("mpwd");
		HttpSession sessionObj = request.getSession();
		//System.out.println( sessionObj.getId() );
		sessionObj.setAttribute("login_id", idFromView);
		sessionObj.setAttribute("login_pwd", pwdFromView);

		response.sendRedirect("./SessionResult11");
	}//doPost

}//class












