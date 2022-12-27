package kr.co.kico.home.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.kico.dto.BoardDTO;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired 
	private BoardService service;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String BoardList(HttpSession session, Model model) {
		logger.info("select_all_board start");
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		List<BoardDTO> board_list = null; //글 목록
		board_list = service.selectAllBoard();
		 
		List<BoardDTO> menu_list = null; //메뉴 목록
		menu_list = service.selectAllMenu();
		
		model.addAttribute("board_list",board_list);
		model.addAttribute("menu_list",menu_list);
		
		return "home_board/home";
	}
	
	@RequestMapping(value = "/select_all_board/detail", method = RequestMethod.GET)
	public String detail(String bno, HttpSession session, Model model) { //페이지를 새로 열어야 함
		
		List<BoardDTO> menu_list = null;
		menu_list = service.selectAllMenu();
		
		BoardDTO dto = service.detail(bno);
		//bno를 파라미터로 하여 서비스에서 세팅해주기
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
			String mno = member_dto.getMno();
			
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("mno",mno);
			model.addAttribute("messageFromServer","success");
		}
		
		model.addAttribute("detail_dto",dto);
		model.addAttribute("menu_list",menu_list);
		//모델에 담아야 함, 이 모델에서 지정해 준 값으로 jsp에서 데이터를 보낼 수 있음
		
		return "home_board/detail"; //jsp file name
	}//detail
	
	@RequestMapping(value = "/select_all_menu/detail", method = RequestMethod.GET)
	public String menuList(String mno, HttpSession session, Model model) { //페이지를 새로 열어야 함
		System.out.println(mno);
		List<BoardDTO> menu_list = null; //메뉴 목록
		menu_list = service.selectAllMenu();
		
		List<BoardDTO> board_list = null; //게시글 목록 상세 조회
		board_list = service.selectMatchBoard(mno);
		for(BoardDTO li : board_list) {
			System.out.println(li.getBno());
		}
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
			
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		model.addAttribute("menu_list",menu_list);
		model.addAttribute("board_list",board_list);
		return "home_board/menuDetail"; 
	}//menuList
	
	@RequestMapping(value = "/write-board", method = RequestMethod.GET) 
	public String boardForm(Locale locale, HttpSession session, Model model) { 
		List<BoardDTO> menu_list = null; //메뉴 목록
		menu_list = service.selectAllMenu();
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
			String mno = member_dto.getMno();
			
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("mno",mno);
			
			model.addAttribute("messageFromServer","success");
		}
		
		model.addAttribute("menu_list",menu_list);

		return "home_board/boardForm"; 
	}
	
	@RequestMapping(value = "/write-board/insert", method = RequestMethod.POST) 
	public void boardInsert(Locale locale, BoardDTO dto, Model model, HttpServletResponse resp) throws IOException {
		int successCount = service.insBoard(dto);

		JSONObject json = new JSONObject();

	    json.put("code", "200");
	    json.put("msg", "success");
	    PrintWriter out = resp.getWriter();
	     
	    out.print(json);
	}
	
	@RequestMapping(value = "/delete/board", method = RequestMethod.GET) 
	public String boardDelete(BoardDTO dto, PrintWriter out){
		int successCount = service.deleteBoard(dto);
		System.out.println(successCount);
		out.print(successCount);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/update/board/form", method = RequestMethod.GET) 
	public String boardUpdateForm(String bno, Model model, HttpSession session) throws IOException {
		
		List<BoardDTO> menu_list = null; //메뉴 목록
		menu_list = service.selectAllMenu();
		
		BoardDTO dto = service.detail(bno);
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
			String mno = member_dto.getMno();
			
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("mno",mno);
			
			model.addAttribute("messageFromServer","success");
		}
		
		model.addAttribute("menu_list",menu_list);
		model.addAttribute("detail_dto",dto);
		model.addAttribute("update_yn","yes");
		
		return "home_board/boardForm"; 
	}
	
	@RequestMapping(value = "/update/board", method = RequestMethod.POST) 
	public void boardUpdate(BoardDTO dto, Model model, PrintWriter out) throws IOException {
		int successCount = service.updateBoard(dto);
		System.out.println(successCount);
	    out.print(out);
	}
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) { return "home"; }
	 */
}
