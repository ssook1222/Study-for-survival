package kr.co.kico.mywork.signup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SignupService {

	@Autowired
	private SignupDAO dao;
	
	public int insLogin(SignupDTO dto) {
		int successCount = 0;
		successCount = dao.insLogin(dto);
		return successCount;
		
	}//insLogin
	
	public int idDupCheck(String mid) {
		int idCnt = dao.idDupCheck(mid);
		return idCnt;
	}//idDupCheck
	
}
