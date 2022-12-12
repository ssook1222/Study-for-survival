package kr.co.kico;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FirstTestController {

	private static final Logger logger = LoggerFactory.getLogger(FirstTestController.class);

	@Autowired
	private FirstTestService service;

	@RequestMapping( value = "/select_all_emp", method = RequestMethod.GET )
	public String selectAllEmp( Model model ) {
		logger.info("select_all_emp start");

		//controller -> service -> dao -> mapper -> db -> mapper -> dao -> service -> controller -> model
		List<FirstTestDTO> list = null;
		list = service.selectAllEmp();

		model.addAttribute("emp_list", list);

		return "./first_test";//jsp 파일 이름.
	}//selectAllEmp

}//class




