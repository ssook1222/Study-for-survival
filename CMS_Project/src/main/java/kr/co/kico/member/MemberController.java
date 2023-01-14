package kr.co.kico.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.kico.dto.BoardDTO;
import kr.co.kico.home.board.BoardService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired 
	private BoardService board_service;
	
	@RequestMapping(value = "/login/form", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login"; 
	}//loginForm
	
	@RequestMapping(value = "/signup/form", method = RequestMethod.GET)
	public String signupForm() {
		return "member/signup"; 
	}//signupForm
	
	@RequestMapping(value = "/login/check", method = RequestMethod.POST)
	public String login(BoardDTO dto, HttpSession session, Model model) {
		dto = service.login(dto);
		
		if(dto != null && dto.getMno()!= null && !dto.getMno().equals("")) {
			session.setAttribute("login_info", dto);
			model.addAttribute("messageFromServer","success");
			String mname = dto.getMname();
			model.addAttribute("member_name",mname);
			
			List<BoardDTO> board_list = null; //글 목록
			board_list = board_service.selectAllBoard();
			 
			List<BoardDTO> menu_list = null; //메뉴 목록
			menu_list = board_service.selectAllMenu();
			
			model.addAttribute("board_list",board_list);
			model.addAttribute("menu_list",menu_list);
			model.addAttribute("member_id", dto.getMname());
			
		}//로그인 성공
		else {
			model.addAttribute("messageFromServer","fail");
			return "member/login";
		}//로그인 실패
		
		return "home_board/home";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("messageFromServer","로그아웃 되엇슴다");
		
		List<BoardDTO> board_list = null; //글 목록
		board_list = board_service.selectAllBoard();
		 
		List<BoardDTO> menu_list = null; //메뉴 목록
		menu_list = board_service.selectAllMenu();
		
		model.addAttribute("board_list",board_list);
		model.addAttribute("menu_list",menu_list);
		
		return "home_board/home";
	}
	
	@RequestMapping( value = "/dupCheck", method = RequestMethod.GET )
	public void idDupCheck(String mid, PrintWriter out) {
		int idCnt = service.idDupCheck(mid);
		System.out.println(idCnt);
		out.print(idCnt);
	}//idDupCheck
	
	@RequestMapping(value="/sign-up", method = RequestMethod.POST)
	public void insertData(BoardDTO dto, PrintWriter out) {
		int successCount = service.signup(dto);
		out.print(successCount);
	}//insertData
}
