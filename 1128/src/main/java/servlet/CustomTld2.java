package jsp;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class CustomTld2 extends SimpleTagSupport {
	
	public CustomTld2() {
		
	}
	
	private String colorChoose = "blue";
	private String stringInput = "집이 그립습니다...";
		
	public String getColorChoose() {
		return colorChoose;
	}

	public void setColorChoose(String colorChoose) {
		this.colorChoose = colorChoose;
	}

	public String getStringInput() {
		return stringInput;
	}

	public void setStringInput(String stringInput) {
		this.stringInput = stringInput;
	}

	@Override
	public void doTag() throws JspException, IOException{
		JspWriter out = getJspContext().getOut();
		out.print("<h1><font color="+colorChoose+">"+stringInput+"</font></h1>");
	}//doTag
	
}//class
