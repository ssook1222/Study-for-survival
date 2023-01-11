package kr.co.kico.mywork.signup;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SignupDAO {

	@Autowired
	private SqlSession sqlSession;

	public int insLogin(SignupDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("LoginMapper.insLogin",dto);
		return successCount;
	}//insLogin

	public int idDupCheck(String mid) {
		int idCnt = sqlSession.selectOne("LoginMapper.idDupCheck", mid);
		return idCnt;
	}//idDupCheck
	
	public int pwdDupCheck(String mpwd) {
		int pwdCnt = sqlSession.selectOne("LoginMapper.pwDupCheck", mpwd);
		return pwdCnt;
	}//pwdDupCheck

}
