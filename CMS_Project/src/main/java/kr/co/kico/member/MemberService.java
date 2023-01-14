package kr.co.kico.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kico.dto.BoardDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;

	public BoardDTO login(BoardDTO dto) {
		dto = dao.login(dto);
		return dto;
	}

	public int idDupCheck(String mid) {
		int idCnt = dao.idDupCheck(mid);
		return idCnt;
	}

	public int signup(BoardDTO dto) {
		int successCount = 0;
		successCount = dao.signup(dto);
		return successCount;
	}

}
