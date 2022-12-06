<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05session_getAtrribute</title>
</head>
<body>
	<h1>getAttribute</h1>
	<%-- 실행 순서는 05 session_setAttribute -> 05session_getAttribute --%>
	<%-- 하나의 클라이언트는 하나의 저장소를 공유하기 때문에 
	각각의 서블릿이 실행된다고 해도, 같은 클라이언트는 데이터 공유가 가능하다.--%>	
	<%= session.getAttribute("mid") %>
	<%= session.getAttribute("mname") %>
	<%= session.getAttribute("ListObj") %>
</body>
</html>