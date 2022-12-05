package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReqSetAttr07")
public class ReqSetAttr07 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReqSetAttr07() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptDTO dto = new DeptDTO();
		dto.setDname( "education service" );

		ArrayList<String> list = new ArrayList<String>();
		list.add("apple");list.add("banana");list.add("cherry");

		request.setAttribute("req_data", "data in request");
		request.setAttribute("req_dto", dto);
		request.setAttribute("req_list", list);

		ServletContext ctx = getServletContext();
		ctx.setAttribute("ctx_data", "data in context");
		ctx.setAttribute("ctx_dto", dto);
		ctx.setAttribute("ctx_list", list);
	}//get

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}







