package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet( urlPatterns = {"/Config08", "/really", "/wow"}
			, initParams = {
					@WebInitParam( name = "time1", value = "breakfast" )	
					, @WebInitParam( name = "time2", value = "lunch" )	
					, @WebInitParam( name = "time3", value = "dinner" )
			})
public class Config08 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Config08() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletConfig conf = getServletConfig();

		PrintWriter out = response.getWriter();
		out.print("<h1>" + conf.getServletName() + "</h1>" );

		out.print("<h1>" + conf.getInitParameter("time1") + "</h1>" );
		out.print("<h1>" + conf.getInitParameter("time2") + "</h1>" );
		out.print("<h1>" + conf.getInitParameter("time3") + "</h1>" );

		Enumeration<String> enumer = conf.getInitParameterNames();
		while(enumer.hasMoreElements()) {
			String tmpStr = enumer.nextElement();
			out.print("<h1>" + tmpStr + " : " + conf.getInitParameter( tmpStr ) + "</h1>" );
		}//while

		out.close();
	}//get

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}//class





