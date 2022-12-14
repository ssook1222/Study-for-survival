package kr.co.kico.mywork;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginService {

	@Autowired
	private LoginDAO dao;
	
	public int insLogin(LoginDTO dto) {
		int successCount = 0;
		successCount = dao.insLogin(dto);
		return successCount;
		
	}//insLogin
	
}
