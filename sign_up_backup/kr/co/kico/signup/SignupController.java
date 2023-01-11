package kr.co.kico.mywork.signup;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value="/sign-up")
public class SignupController {

	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);
	
	@Autowired
	private SignupService service;
	
	@RequestMapping( value = "/dupCheck", method = RequestMethod.GET )
	public void idDupCheck(String mid, PrintWriter out) {
		int idCnt = service.idDupCheck(mid);
		System.out.println(idCnt);
		out.print(idCnt);
	}//idDupCheck
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public void insertData(SignupDTO dto, PrintWriter out) {
		int successCount = service.insLogin(dto);
		out.print(successCount);
	}//insertData
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String callSignupForm() {
		return "mywork/signup_form"; //jspFileName 리턴
	}//callSignupForm
	
}
