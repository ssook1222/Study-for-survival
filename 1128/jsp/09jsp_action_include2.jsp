<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>09jsp_action_include2.jsp START</h1>
	
	<% request.setAttribute("data1","11111");%>
	<%-- 첫 전통적인 방식 --%>
	
	<jsp:include page="./09jsp_action_include3.jsp">
		<jsp:param value="22222" name="data2"/>
	</jsp:include>
	
	<% request.getAttribute("data3");%>
	<%-- <h1><%= iVar09 %></h1> --%>
	<%-- 변수 자체를 찾지 못하고 있음. error이므로 이런 방식으로 작성하면 안 됨 --%>
	
	<h1>09jsp_action_include2.jsp END</h1>

</body>
</html>