<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06application_getAtrribute</title>
</head>
<body>
	<h1>getAttribute</h1>
	<%-- 실행 순서는 06application_setAttribute -> 06application_getAttribute --%>
	<%-- 프로젝트에 있는 모든 서블릿이 하나의 컨텍스트 안에 있는 데이터를 공유
	그래서 각각의 서블릿이 실행되어도, 같은 data 공유 가능
	서블릿 컨텍스트의 종료는 서버 다운 밖에 없음,
	이걸로 변경처리를 해주면 됨. 
	--%>	
	<%= application.getAttribute("mid") %>
	<%= application.getAttribute("mname") %>
	<%= application.getAttribute("ListObj") %>
</body>
</html>