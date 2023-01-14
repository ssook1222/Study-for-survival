package kr.co.kico.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kico.dto.BoardDTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> selectAllBoard() {
		List<BoardDTO> list= null;
		
		list = sqlSession.selectList("AdminMapper.selectAllMenu");
		/* System.out.println("=====BoardDAO.selectAllBoard: "+list); */
		
		return list;
	}

	public int updateMenu(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.updateMenu",dto);
		return successCount;
	}

	public int deleteMenu(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("AdminMapper.deleteMenu",dto);
		return successCount;
	}
	
	public int deleteMenuWithBoard(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("AdminMapper.deleteBoard",dto);
		return successCount;
	}

	public int insertMenu(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("AdminMapper.insertMenu",dto);
		return successCount;
	}

	public List<BoardDTO> selectAllmember() {
		List<BoardDTO> list= null;
		
		list = sqlSession.selectList("AdminMapper.selectAllMember");
		/* System.out.println("=====BoardDAO.selectAllBoard: "+list); */
		
		return list;
	}

	public int updateMember(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.updateMember",dto);
		return successCount;
	}

	public int deleteMember(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("AdminMapper.deleteMember",dto);
		return successCount;
	}
	
	public List<BoardDTO> selectAllGroup() {
		List<BoardDTO> list= null;
		
		list = sqlSession.selectList("AdminMapper.selectAllMgname");
		/* System.out.println("=====BoardDAO.selectAllBoard: "+list); */
		
		return list;
	}
	
	public List<BoardDTO> selectAllGroupMenuaccess() {
		List<BoardDTO> list= null;
		
		list = sqlSession.selectList("AdminMapper.selectAllMgAccessList");
		/* System.out.println("=====BoardDAO.selectAllBoard: "+list); */
		
		return list;
	}

	public int updateGroup(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.updateGroup",dto);
		return successCount;
	}
	
	public int updateGroupWithUpdate(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.updateGroupWithMember",dto);
		return successCount;
	}
	
	public int deleteGroup(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("AdminMapper.deleteGroup",dto);
		return successCount;
	}
	
	public int deleteGroupWithUpdate(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.deleteGroupWithMember",dto);
		return successCount;
	}

	public int insertGroup(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("AdminMapper.insertMemberGroup",dto);
		return successCount;
	}

	public int groupDupCheck(String access) {
		int groupCnt = sqlSession.selectOne("AdminMapper.groupDupCheck", access);
		return groupCnt;
	}
}
