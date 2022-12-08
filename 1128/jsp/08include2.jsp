<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>08.Include2.jsp</title>
	</head>
	<body>
	<form id="form1">
		<input type="text" id="txt1" name="txt1" value="This is data from client.">
		<button type="button" onclick="callServer();">data send</button>
	</form>
	
	<h1>08include2 START</h1>
	<% request.setAttribute("addData1", "this is add Data."); %>
	<%@ include file="./08include3.jsp" %>
	<h1><%= request.getAttribute("addData2") %></h1>
	<h1><%= iVar08 %></h1>
	<%-- 선언 전에는 참조가 안 되지만, 파일을 넣은 이후에는 참조가 가능함. --%>
	
	<h1>08include2 END</h1>
	
	</body>
</html>