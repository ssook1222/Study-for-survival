<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>09jsp_action_include3.jsp START</h1>

	<%= request.getParameter("txt1") %>
	<%= request.getAttribute("data1") %>
	<%= request.getParameter("data2") %>	
	<%-- 받을 때 getAttribute로 받아줌. 이 때 param으로 넘긴 건 null로 나옴. --%>
	
	<% request.setAttribute("data3", "33333"); %>	
	<%-- 어트리뷰트 세팅해줬을 때 2번에서 이걸 받을 수 있는지 확인용 --%>
	
	<% int iVar09 = 999; %>
	<%-- 변수 자체를 찾지 못하고 있음. error이므로 이런 방식으로 작성하면 안 됨 --%>
	
	<h1>09jsp_action_include3.jsp END</h1>

</body>
</html>