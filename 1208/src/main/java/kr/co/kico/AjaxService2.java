package kr.co.kico;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AjaxService2 {

	@Autowired
	private AjaxDAO2 dao;

	public int idDupCheck(String mid) {
		int idCnt = dao.idDupCheck(mid);
		return idCnt;
	}//idDupCheck

}//class
