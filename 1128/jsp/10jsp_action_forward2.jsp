<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10jsp_action_forward2.jsp</title>
</head>
<body>
	<h1>10jsp_action_include2.jsp START</h1>
	
	<% request.setAttribute("data1","11111"); %>
	
	<jsp:forward page="./10jsp_action_forward3.jsp">
		<jsp:param value="22222" name="data2"></jsp:param>
	</jsp:forward>
	
	<h1>10jsp_action_include2.jsp END</h1>
</body>
</html>