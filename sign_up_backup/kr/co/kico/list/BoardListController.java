package kr.co.kico.mywork.list;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.kico.board.free.BoardFreeService;
import kr.co.kico.dto.FreeBoardDTO;
import kr.co.kico.file.FileTestDTO3;
import kr.co.kico.mywork.signup.SignupController;
import kr.co.kico.start.firstTestService;



@Controller
@RequestMapping(value="/board")
public class BoardListController {
	
	private static final Logger logger = LoggerFactory.getLogger(SignupController.class);
	
	@Autowired BoardFreeService service;
	
	@RequestMapping(value="/select_all_board", method=RequestMethod.GET) //JSP의 form method와 동잏하게 맞춰줘야 함.
	public String selectAllBoard(Model model) {
		logger.info("select_all_board_Start");
		
		List<FileTestDTO3> list = null;
		list = service.selectAllBoard();
		model.addAttribute("board_list",list);
		
		return "mywork/board_list";
		
	}//selectAllBoard
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String callBoardList() {
		return "mywork/board_list"; //jspFileName 리턴
	}//callBoardList                                                                                                                                                    
}
