<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02paramget.jsp</title>
</head>
<body>
	<h5>jsp 내장 객체 : request, response, session, out</h5>
	<h3>
		<%= request.getParameter("name") %>
		<%= request.getParameter("hid_txt") %>
		<%= request.getParameter("pwd") %>
		<%= request.getParameter("gender") %>
		<%= request.getParameter("sel1") %>
		<% 
			String [] tmpArr = request.getParameterValues("sports"); 
			for(int i=0; i<tmpArr.length;i++){
		%>
			<%= tmpArr[i] %> <br> <%-- 스크립트 조각내는 것, 원래는 하나의 태그에 있어야 되는 것을
			쪼개서 다른 태그 중간에 넣어주는 형식 --%>
		<% 
			}
		%>		
			
		<br><%= session.getId() %>
		<br><% out.print("really?"); %>
		<%-- <br><% response.sendRedirect("http://www.naver.com"); --%>
	</h3>
</body>
</html>