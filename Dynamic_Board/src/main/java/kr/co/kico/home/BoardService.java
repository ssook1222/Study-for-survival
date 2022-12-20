package kr.co.kico.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao; 

	public List<BoardDTO> selectAllBoard() {
		List<BoardDTO> list = null;
		System.out.println("=====SELECT ALL BOARD=====");
		list = dao.selectAllBoard();
		return list;
	} //selectAllBoard()
	
	public List<BoardDTO> selectAllText() {
		List<BoardDTO> list = null;
		System.out.println("=====SELECT ALL Text=====");
		list = dao.selectAllText();
		return list;
	} //selectAllText()

	public BoardDTO detail(String bno) {
		BoardDTO dto = null;
		dto = dao.detail(bno);
		return dto;
	}//detail

	public int insMname(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.insMname(dto);
		return successCount;
	}//insMname

	public List<BoardDTO> selectMenuList(String mno) {
		List<BoardDTO> list = null;
		System.out.println("=====SELECT Menu List=====");
		list = dao.selectMenuList(mno);
		System.out.println("=====???=====");
		return list;
	}//selectMenuList

	public int insBoard(BoardDTO dto) {
		int successCount = 0;
		System.out.println("a");
		successCount = dao.insBoard(dto);
		System.out.println("b");
		return successCount;
	}

	public int updateMname(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.updateMname(dto);
		return successCount;
	}
}
