package kr.co.kico.home.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kico.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<BoardDTO> selectAllBoard() {
		List<BoardDTO> list= null;
		
		list = sqlSession.selectList("BoardMapper.selectAllBoard");
		/* System.out.println("=====BoardDAO.selectAllBoard: "+list); */
		
		return list;
	}

	public List<BoardDTO> selectAllMenu() {
		List<BoardDTO> list= null;
		
		list = sqlSession.selectList("BoardMapper.selectAllMenu");
		/* System.out.println("=====BoardDAO.selectAllBoard: "+list); */
		
		return list;
	}

	public BoardDTO detail(String bno) {
		BoardDTO dto = null;
		dto = sqlSession.selectOne("BoardMapper.detail",bno);
		return dto;
	}

	public List<BoardDTO> selectMatchBoard(String mno) {
		List<BoardDTO> list= null;
		list = sqlSession.selectList("BoardMapper.selectMatchBoard",mno);
		return list;
	}

	public int insBoard(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("BoardMapper.insBoard",dto);
		return successCount;
	}

	public int deleteBoard(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("BoardMapper.delBoard",dto);
		return successCount;
	}

	public int updateBoard(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("BoardMapper.updateBoard",dto);
		return successCount;
	}

}
