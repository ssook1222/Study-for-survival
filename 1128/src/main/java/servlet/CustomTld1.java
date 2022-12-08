package jsp;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class CustomTld1 extends SimpleTagSupport {

	public CustomTld1() {
		
	}
	
	@Override
	public void doTag() throws JspException, IOException{
		JspWriter out = getJspContext().getOut();
		out.print("<h1>커스텀 태그의 TLD 파일을 테스트 중임다.</h1>");
	}//doTag
	
}//class
