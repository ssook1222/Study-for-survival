package kr.co.kico.mywork.login;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.kico.mywork.signup.SignupController;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);
	
	@Autowired
	private LoginService service;
	
	@RequestMapping( value = "/check", method = RequestMethod.GET )
	public void LoginCheck(String mid, String mpwd, PrintWriter out) {
		int idCnt = service.idCheck(mid);
		int pwdCnt = service.pwdCheck(mpwd);
		
		if(idCnt !=0 && pwdCnt != 0) {
			out.print(idCnt);
		}
	}//LoginCheck
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String callLoginForm() {
		return "mywork/login_form"; //jspFileName 리턴
	}//callLoginForm
}
