package kr.co.kico.admin;

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

@RequestMapping(value = "/admin")
@Controller
public class AdminController {
	
	@Autowired 
	private BoardService service;
	
	@Autowired
	private AdminService admin_service;
	
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String MemberAdminPage(HttpSession session, Model model) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		List<BoardDTO> menu_list = null; //메뉴 목록
		menu_list = service.selectAllMenu();
		model.addAttribute("menu_list",menu_list);
		
		List<BoardDTO> member_list = null; //멤버 목록
		member_list = admin_service.selectAllmember();
		model.addAttribute("member_list",member_list);
		
		return "admin/member_admin";
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public String MemberUpdatePage(BoardDTO dto, HttpSession session, Model model) {
		
		List<BoardDTO> group_list = null; //회원 그룹 목록
		group_list = admin_service.selectAllgroup();
		model.addAttribute("group_list",group_list);
		
		System.out.println(dto.getMname());
		
		model.addAttribute("mname",dto.getMname());
		model.addAttribute("mgname",dto.getMgname());
		model.addAttribute("mid",dto.getMid());
		
		return "admin/member_manage";
	}
	
	@RequestMapping(value="/member/update/data", method=RequestMethod.POST)
	public void MemberUpdateData(BoardDTO dto, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		int successCount = admin_service.updateMember(dto);
	    out.print(out);	
	}
	
	@RequestMapping(value="/member/delete/data", method=RequestMethod.POST)
	public void MemberDeleteData(BoardDTO dto, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		int successCount = admin_service.deleteMember(dto);
	    out.print(out);	
	}
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String BoardAdminPage(HttpSession session, Model model) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		List<BoardDTO> menu_list = null; //메뉴 목록
		menu_list = service.selectAllMenu();
		model.addAttribute("menu_list",menu_list);
		
		List<BoardDTO> board_list = null; //게시판 목록
		board_list = admin_service.selectAllboard();
		model.addAttribute("board_list",board_list);
		
		List<BoardDTO> group_list = null; //회원 그룹 목록
		group_list = admin_service.selectAllgroup();
		model.addAttribute("group_list",group_list);
		model.addAttribute("group_list_size",group_list.size()-1);
		
		return "admin/board_admin";
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.GET)
	public String BoardUpdatePage(BoardDTO dto, HttpSession session, Model model) {
		
		List<BoardDTO> group_list = null; //회원 그룹 목록
		group_list = admin_service.selectAllgroup();
		model.addAttribute("group_list",group_list);
		
		model.addAttribute("mgno",dto.getMgno());
		model.addAttribute("menuno",dto.getMenuno());
		model.addAttribute("mgname",dto.getMgname());
		model.addAttribute("menuname",dto.getMenuname());
		
		return "admin/board_manage";
	}
	
	@RequestMapping(value="/board/update/data", method=RequestMethod.POST)
	public void BoardUpdateData(BoardDTO dto, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		int successCount = admin_service.updateMenu(dto);
	    out.print(out);	
	}
	
	@RequestMapping(value="/board/delete/data", method=RequestMethod.POST)
	public void BoardDeleteData(BoardDTO dto, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		int successCount1 = admin_service.deleteMenu(dto);
		int successCount2 = admin_service.deleteBoard(dto);
	    out.print(out);	
	}
	
	@RequestMapping(value="/board/insert/data", method=RequestMethod.POST)
	public void BoardInsertData(BoardDTO dto, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		System.out.println(dto.getMenuname());
		
		int successCount = admin_service.insertMenu(dto);
	    out.print(out);	
	}
	
	@RequestMapping(value="/group", method=RequestMethod.GET)
	public String GroupAdminPage(HttpSession session, Model model) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		List<BoardDTO> group_list = null; //회원 그룹 목록
		group_list = admin_service.selectAllgroup();
		model.addAttribute("group_list",group_list);
		
		List<BoardDTO> menu_list = null; //메뉴 목록
		menu_list = service.selectAllMenu();
		model.addAttribute("menu_list",menu_list);
		
		List<BoardDTO> access_list = null; //회원 그룹 엑세스 목록
		access_list = admin_service.selectAllMenuAccess();
		model.addAttribute("access_list",access_list);
		
		return "admin/group_admin";
	}
	
	@RequestMapping(value="/group/update", method=RequestMethod.GET)
	public String GroupUpdatePage(BoardDTO dto, HttpSession session, Model model) {
		
		List<BoardDTO> group_list = null; //회원 그룹 목록
		group_list = admin_service.selectAllgroup();
		model.addAttribute("group_list",group_list);
		
		List<BoardDTO> access_list = null; //회원 그룹 엑세스 목록
		access_list = admin_service.selectAllMenuAccess();
		model.addAttribute("access_list",access_list);
		
		model.addAttribute("mgno",dto.getMgno());
		model.addAttribute("mgname",dto.getMgname());
		model.addAttribute("menuaccess",dto.getMenuaccess());
		
		return "admin/group_manage";
	}
	
	@RequestMapping(value="/group/update/data", method=RequestMethod.POST)
	public void GroupUpdateData(BoardDTO dto, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		int successCount1 = admin_service.updateGroupWithUpdate(dto);
		int successCount2 = admin_service.updateGroup(dto);
		
	    out.print(out);	
	}
	
	@RequestMapping(value="/group/delete/data", method=RequestMethod.POST)
	public void GroupDeleteData(BoardDTO dto, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		int successCount1 = admin_service.deleteGroupWithUpdate(dto);
		int successCount2 = admin_service.deleteGroup(dto);
		
	    out.print(out);	
	}
	
	@RequestMapping(value="/group/insert/data", method=RequestMethod.POST)
	public void GroupInsertData(BoardDTO dto, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		
		int successCount = admin_service.insertGroup(dto);
		
	    out.print(out);	
	}
	
	@RequestMapping(value="/group/dupCheck", method=RequestMethod.GET)
	public void GroupDupCheck(String menuaccess, PrintWriter out, Model model, HttpSession session) {
		
		if(session.getAttribute("login_info") != null) {
			BoardDTO member_dto = (BoardDTO) session.getAttribute("login_info");
			String mname = member_dto.getMname();
			String menu_access = member_dto.getMgno();
		
			model.addAttribute("member_name",mname);
			model.addAttribute("menu_access",menu_access);
			model.addAttribute("messageFromServer","success");
		}
		int groupCnt = admin_service.groupDupCheck(menuaccess);
		System.out.println(groupCnt);
		out.print(groupCnt);
	}
	
}
