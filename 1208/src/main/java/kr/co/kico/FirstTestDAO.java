package kr.co.kico;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FirstTestDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<FirstTestDTO> selectAllEmp() {
		List<FirstTestDTO> list = null;
		System.out.println("===== FirstTestDAO.selectAllEmp =====");
		//MapperName과 MapperFileName은 서로 다른 존재 -> MapperFileName 호출 금지.
		list = sqlSession.selectList("EmpMapper.selectAllEmpList");
		System.out.println("===== FirstTestDAO.list : " + list);
		return list;
	}//selectAllEmp

}//class



