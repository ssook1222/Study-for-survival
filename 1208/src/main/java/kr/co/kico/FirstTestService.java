package kr.co.kico;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FirstTestService {

	@Autowired
	private FirstTestDAO dao;

	public List<FirstTestDTO> selectAllEmp(){
		List<FirstTestDTO> list = null;
		System.out.println("===== FirstTestService.selectAllEmp =====");
		list = dao.selectAllEmp();
		return list;
	}//selectAllEmp

}//class




