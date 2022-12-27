package kr.co.kico.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kico.dto.BoardDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public BoardDTO login(BoardDTO dto) {
		dto = sqlSession.selectOne("BoardMapper.Login",dto);
		return dto;
	}
	
	public int idDupCheck(String mid) {
		int idCnt = sqlSession.selectOne("BoardMapper.idDupCheck", mid);
		return idCnt;
	}//idDupCheck

	public int signup(BoardDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("BoardMapper.signup",dto);
		return successCount;
	}

}
