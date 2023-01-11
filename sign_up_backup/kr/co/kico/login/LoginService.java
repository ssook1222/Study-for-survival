package kr.co.kico.mywork.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kico.mywork.signup.SignupDAO;

@Service
public class LoginService {
	
	@Autowired
	private SignupDAO dao;

	public int idCheck(String mid) {
		int idCnt = dao.idDupCheck(mid);
		return idCnt;
	}

	public int pwdCheck(String mpwd) {
		int pwdCnt = dao.pwdDupCheck(mpwd);
		return pwdCnt;
	}

}
