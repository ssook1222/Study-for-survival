<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11use_bean.jsp</title>
</head>
<body>
	<%-- 전통적인 방식으로 진행 --%>
	<h1>11use_bean1 Start</h1>
	<h2>Use Bean을 사용하기 전</h2>
	<h3><%= request.getParameter("mid") %></h3>
	<h3><%= request.getParameter("mname") %></h3>
	<h3><%= request.getParameter("maddr") %></h3>
	<h3><%= request.getParameter("mtel") %></h3>
	<h1>11use_bean1 End</h1>
</body>
</html>