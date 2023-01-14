package kr.co.kico.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kico.dto.BoardDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;
	
	public List<BoardDTO> selectAllboard() {
		List<BoardDTO> list = null;
		list = dao.selectAllBoard();
		return list;
	}

	public int updateMenu(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.updateMenu(dto);
		return successCount;
	}

	public int deleteMenu(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.deleteMenu(dto);
		return 0;
	}
	
	public int deleteBoard(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.deleteMenuWithBoard(dto);
		return 0;
	}

	public int insertMenu(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.insertMenu(dto);
		return 0;
	}

	public List<BoardDTO> selectAllmember() {
		List<BoardDTO> list = null;
		list = dao.selectAllmember();
		return list;
	}

	public int updateMember(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.updateMember(dto);
		return successCount;
	}

	public int deleteMember(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.deleteMember(dto);
		return 0;
	}
	
	public List<BoardDTO> selectAllgroup() {
		List<BoardDTO> list = null;
		list = dao.selectAllGroup();
		return list;
	}
	
	public List<BoardDTO> selectAllMenuAccess() {
		List<BoardDTO> list = null;
		list = dao.selectAllGroupMenuaccess();
		return list;
	}

	public int updateGroup(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.updateGroup(dto);
		return successCount;
	}
	
	public int updateGroupWithUpdate(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.updateGroupWithUpdate(dto);
		return successCount;
	}
	
	public int deleteGroup(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.deleteGroup(dto);
		return successCount;
	}
	
	public int deleteGroupWithUpdate(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.deleteGroupWithUpdate(dto);
		return successCount;
	}

	public int insertGroup(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.insertGroup(dto);
		return successCount;
	}
	
	public int groupDupCheck(String access) {
		int groupCnt = dao.groupDupCheck(access);
		return groupCnt;
	}
}
