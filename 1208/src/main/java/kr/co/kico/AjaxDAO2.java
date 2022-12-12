package kr.co.kico;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxDAO2 {

	@Autowired
	private SqlSession session;

	public int idDupCheck(String mid) {
		int idCnt = session.selectOne("Ajax2Mapper.idDupCheck", mid);
		return idCnt;
	}//idDupCheck

}//class





