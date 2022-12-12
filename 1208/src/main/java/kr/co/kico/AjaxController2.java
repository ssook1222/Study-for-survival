package kr.co.kico;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AjaxController2 {

	private static final Logger logger = LoggerFactory.getLogger(AjaxController2.class);

	@Autowired
	private AjaxService2 service;

	@RequestMapping( value = "/ajax12return", method = RequestMethod.GET )
	public void ajax12Return(String mid, PrintWriter out) {
		//ID 중복 체크는 DB에 아이디가 존재하는지 여부를 확인.(DDL은 맨 아래에서 확인)
		int idCnt = service.idDupCheck(mid);
		out.print(idCnt);
	}//ajax12Return

	@RequestMapping( value = "/ajax12", method = RequestMethod.GET )
	public String page4Ajax12() {
		return "ajax12";//jsp file name
	}//page4Ajax12

	@RequestMapping( value = "/ajax11return", method = RequestMethod.GET )
	public void ajax11Return(String data1, String data2, PrintWriter out) {
		out.print("신나는 " + data1 + ", 즐거운 " + data2 + " !!");
	}//ajax11Return

	@RequestMapping( value = "/ajax11", method = RequestMethod.GET )
	public String page4Ajax11() {
		return "ajax11";//jsp file name
	}//page4Ajax11

}//class

/*
create sequence seq_mno
start with 1
maxvalue 99999
increment by 1
nocycle;

select seq_mno.nextval from dual;
select seq_mno.currval from dual;

create table member
(
	mno number(5,0) primary key
	, mid varchar2(20)
	, mpwd varchar2(20)
	, mname varchar2(60)
);

insert into member values(seq_mno.nextval, 'apple', '1111', '강길동');
insert into member values(seq_mno.nextval, 'banana', '1111', '고길동');
insert into member values(seq_mno.nextval, 'cherry', '1111', '카드캡터');
commit;

show autocommit;
*/












