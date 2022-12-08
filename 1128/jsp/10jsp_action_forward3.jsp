<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10jsp_action_forward3.jsp</title>
</head>
<body>
	<h3>10jsp_action_include3.jsp START</h3>
	
	<h3>
		<%=request.getParameter("txt1") %>
		<%=request.getAttribute("data1") %>
		<%=request.getParameter("data2") %>
	</h3>
	
	<%--forward2 파일이 무시되고 forward3만 출력되고 있음. --%>
	
	<h3>10jsp_action_include3.jsp END</h3>
</body>
</html>