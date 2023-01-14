package kr.co.kico.home;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BoardController {
	
	private static final Logger Logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired 
	private BoardService service;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String BoardList(Model model) {
		Logger.info("select_all_board start");
		
		List<BoardDTO> board_list = null; //글 목록
		board_list = service.selectAllBoard();
		for(BoardDTO li : board_list) {
			System.out.println(">"+li.getMno());
		}
		
		List<BoardDTO> text_list = null; //메뉴 목록
		text_list = service.selectAllText();
		/*
		 * for(BoardDTO li : text_list) { System.out.println(li.getMname()); }
		 */
		
		model.addAttribute("board_list",board_list);
		model.addAttribute("text_list",text_list);
		
		return "home";
	}
	
	@RequestMapping(value = "/select_all_board/detail", method = RequestMethod.GET)
	public String detail(String bno, Model model) { //페이지를 새로 열어야 함
		
		List<BoardDTO> text_list = null;
		text_list = service.selectAllText();
		
		BoardDTO dto = service.detail(bno);
		//bno를 파라미터로 하여 서비스에서 세팅해주기
		
		model.addAttribute("detail_dto",dto);
		model.addAttribute("text_list",text_list);
		//모델에 담아야 함, 이 모델에서 지정해 준 값으로 jsp에서 데이터를 보낼 수 있음
		
		return "detail"; //jsp file name
	}//detail
	
//	여기 두 개만 나중에 업데이트하기
	
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public void insertData(BoardDTO dto, PrintWriter out) {
		int successCount = service.insMname(dto);
		out.print(successCount);
	}//insertData
	
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public void updateData(BoardDTO dto, PrintWriter out) {
		int successCount = service.updateMname(dto);
		out.print(successCount);
	}//insertData
	

	@RequestMapping(value = "/select_all_menu/detail", method = RequestMethod.GET)
	public String menuList(String mno, Model model) { //페이지를 새로 열어야 함
		System.out.println(mno);
		List<BoardDTO> menu_list = null; //글 목록
		menu_list = service.selectMenuList(mno);
		
		for(BoardDTO li : menu_list) {
			System.out.println(li.getBtitle());
		}
		
		List<BoardDTO> text_list = null; //메뉴 목록
		text_list = service.selectAllText();
		
		for(BoardDTO li : menu_list) {
			System.out.println(li.getMname());
		}
		
		model.addAttribute("menu_list",menu_list);
		model.addAttribute("text_list",text_list);
		return "menuDetail"; 
	}//menuList
	
	@RequestMapping(value="/insert/board-data", method = RequestMethod.POST)
	public void insertBoard(BoardDTO dto, Model model, PrintWriter out) {
		List<BoardDTO> text_list = null; //메뉴 목록
		text_list = service.selectAllText();
		model.addAttribute("text_list",text_list);
		
		/*
		 * for(BoardDTO li : text_list) { System.out.println(li.getMname()); }
		 */
		System.out.println("0");
		int successCount = service.insBoard(dto);
		System.out.println("1");
	}//insertData
	
	@RequestMapping(value="/insert/board", method = RequestMethod.GET)
	public String insertBoardForm(BoardDTO dto, Model model, PrintWriter out) {
		List<BoardDTO> text_list = null; //메뉴 목록
		text_list = service.selectAllText();
		model.addAttribute("text_list",text_list);
		
		return "boardWrite";
	}//insertBoardForm
	
}
