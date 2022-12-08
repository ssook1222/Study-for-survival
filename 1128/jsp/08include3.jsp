<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>08.Include.jsp3</title>
	</head>
	<body>
	
	<h3>08include3 START</h3>
	<h5><%= request.getParameter("txt1") %></h5>
	<h5><%= request.getAttribute("addData1") %></h5>
	<% request.setAttribute("addData2", "this is add Data2!"); %>
	<%-- 데이터를 보내서 다른 jsp파일에 출력하는 거 가능 --%>
	<% int iVar08 = 888; %>
	<h3>08include3 END</h3>
	
	</body>
</html>