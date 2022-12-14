package kr.co.kico.mywork;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;

	public int insLogin(LoginDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("LoginMapper.insLogin",dto);
		return successCount;
	}//insLogin
	
	
	
}
