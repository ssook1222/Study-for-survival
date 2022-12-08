<%@page import="jsp.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11use_bean2.jsp</title>
</head>
<body>
	<h1>11use_bean2 Start</h1>
	<jsp:useBean id="myMember" class="jsp.MemberVO" scope="request"/> 
			<%-- scope는 지금 만든 이 객체의 변수가 가리키는 객체가 살아있는 범위 
		페이지면, 타 페이지로 전달이 안 되고 요청이면 요청이 살아있는 동안,
		세션이면 이 유저가 살아있는 동안임.
		application은 사용 지양, session은 로그인 동안 계속 살아있어야 되는 로직이 있는지
		확인해야 하므로 request가 가장 평범한 로직임.
		--%>
		<%--<% 
			MemberVO myMember = new MemverVO();
			//13번째 줄과 16번째 줄은 같은 내용
			%>
		--%>
		<jsp:setProperty property="mid" name="myMember"/>
		<%-- myMember.setMid(request.getParameter("mid")와 동일,
		spring의 관점/시점 지향 프로그래밍(AOP)- 관점을 기준으로 모듈화
		
		프로세스의 흐름을 놓고 봤을 때, 특정 시점에 끼어드는 것을 이야기함.
		client가 데이터를 send함. 그 클라이언트가 send한 데이터가 서버에 도착하면,
		스프링이 끼어들어서 useBean의 setProperty를 실행시킴.
		서버는 getParam이 아니라 DTO/VO에 데이터가 들어간 상태로 받게 됨.
		--%>
		<jsp:setProperty property="mname" name="myMember"/>
		<jsp:setProperty property="maddr" name="myMember"/>
		<jsp:setProperty property="mtel" name="myMember"/>
		<%--myMember 객체 안에 있는 이 속성들을 쓰겠다는 의미 --%>
		
		<jsp:forward page="./11use_bean3.jsp"></jsp:forward>
	<h1>11use_bean2 End</h1>
</body>
</html>