<%@page import="jsp.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11use_bean3.jsp</title>
</head>
<body>
	<h1>11use_bean3 Start</h1>
	<%--forward시 request를 데리고 가져오므로 당연히 데이터가 받아짐 --%>
		<%=request.getParameter("mid") %>
		<%=request.getParameter("mname") %>
		<%=request.getParameter("maddr") %>
		<%=request.getParameter("mtel") %>
		<hr>
		
		<%--vo.get??? 메소드 --%>
		vo.get???() :
		<jsp:useBean id="myMember" class="jsp.MemberVO" scope="request" />
		<jsp:getProperty property="mid" name="myMember" />
		<jsp:getProperty property="mname" name="myMember" />
		<jsp:getProperty property="maddr" name="myMember"  />
		<jsp:getProperty property="mtel" name="myMember"  />
		
		<hr>
		<%=myMember.getMid() %>
		<%=myMember.getMname() %>
		<%=myMember.getMaddr() %>
		<%=myMember.getMtel() %>
		<hr>
		
	<h1>11use_bean3 End</h1>
</body>
</html>