package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReqGetAttr07")
public class ReqGetAttr07 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReqGetAttr07() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//실행 방법 : ReqSetAttr07 실행 후, ReqGetAttr07 실행 결과 확인.
		PrintWriter out = response.getWriter();
		out.print("<h1>" + request.getAttribute("req_data") +"</h1>");
		out.print("<h1>" + request.getAttribute("req_dto") +"</h1>");
		out.print("<h1>" + request.getAttribute("req_list") +"</h1>");

		ServletContext ctx = getServletContext();
		out.print("<h1>" + ctx.getAttribute("ctx_data") +"</h1>");
		out.print("<h1>" + ctx.getAttribute("ctx_dto") +"</h1>");
		out.print("<h1>" + ctx.getAttribute("ctx_list") +"</h1>");

		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}






