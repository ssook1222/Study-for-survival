package kr.co.kico.mywork;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value="/login")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public void insertData(LoginDTO dto, PrintWriter out) {
		int successCount = service.insLogin(dto);
		out.print(successCount);
	}
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String callLoginForm() {
		return "mywork/login_form"; //jspFileName 리턴
	}//callLoginForm
	
}
