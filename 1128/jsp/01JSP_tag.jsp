<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*" import="java.util.*, java.awt.*"%>
<%@ page import="java.awt.event.*"%>
        
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>01_JSP_Tag</title>
	</head>
	<body>
		주석 태그 : <%-- --%>
		<br> 변수와 메소드 선언 태그 : <%! int iVar2 = 8; %> <%! String sayHello(){return "Hello";} %>
		<br> JSP 파일 선언과 파일 전체에 영향을 주는 페이지 태그 : <%@ page %>
		<br> 소스 코드 작성 태그 : <% int iVar = 7; %>
		<br> 출력 태그	
	</body>
</html>