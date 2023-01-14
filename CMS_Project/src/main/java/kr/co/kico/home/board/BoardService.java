package kr.co.kico.home.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kico.dto.BoardDTO;

@Service 
public class BoardService {
	
	@Autowired
	private BoardDAO dao; 

	public List<BoardDTO> selectAllBoard() {
		List<BoardDTO> list = null;
		list = dao.selectAllBoard();
		return list;
	}

	public List<BoardDTO> selectAllMenu() {
		List<BoardDTO> list = null;
		list = dao.selectAllMenu();
		return list;
	}

	public BoardDTO detail(String bno) {
		BoardDTO dto = null;
		dto = dao.detail(bno);
		return dto;
	}

	public List<BoardDTO> selectMatchBoard(String mno) {
		List<BoardDTO> list = null;
		list = dao.selectMatchBoard(mno);
		return list;
	}

	public int insBoard(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.insBoard(dto);
		return successCount;
	}

	public int deleteBoard(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.deleteBoard(dto);
		return successCount;
	}

	public int updateBoard(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.updateBoard(dto);
		return successCount;
	}
}
