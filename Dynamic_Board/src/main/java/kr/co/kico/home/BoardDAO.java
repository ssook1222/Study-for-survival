package kr.co.kico.home;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> selectAllBoard() {
		
		List<BoardDTO> list= null;
		System.out.println("=====BoardDAO.selectAllBoard=====");
		
		list = sqlSession.selectList("BoardMapper.selectAllBoard");
		System.out.println("=====BoardDAO.selectAllBoard: "+list);
		
		return list;
		
	}//selectAllBoard

	public List<BoardDTO> selectAllText() {
		List<BoardDTO> list= null;
		System.out.println("=====BoardDAO.selectAllBoard=====");
		
		list = sqlSession.selectList("BoardMapper.selectAllText");
		System.out.println("=====BoardDAO.selectAllBoard: "+list);
		
		return list;
	}

	public BoardDTO detail(String bno) {
		BoardDTO dto = null;
		dto = sqlSession.selectOne("BoardMapper.detail",bno); //앞이 매퍼 이름, 다음이 전달하는 값
		return dto;
	}

	public int insMname(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("BoardMapper.insMenu",dto);
		return successCount;
	}//insBname

	public List<BoardDTO> selectMenuList(String mno) {
		List<BoardDTO> list= null;
		System.out.println("=====BoardDAO.selectAllBoard=====");
		list = sqlSession.selectList("BoardMapper.selectMenu",mno);
		System.out.println("=====BoardDAO.selectMenu: "+list);
		
		return list;
	}//selectMenuList

	public int insBoard(BoardDTO dto) {
		int successCount = 0;
		System.out.println("ㄱ");
		successCount = sqlSession.insert("BoardMapper.insBoard",dto);
		System.out.println("ㄴ");
		return successCount;
	}

	public int updateMname(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("BoardMapper.updateMenu",dto);
		return successCount;
	}

	
}
