<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03Script_let1.jsp</title>
</head>
<body>
	<h1>구구단</h1>
	<%
	for(int dan = 2; dan <= 9; dan++){
		for(int gop = 1; gop <= 9 ; gop++){
	%>
	<%= dan %> * <%= gop %>	= <%= dan * gop %>	
	<br>	
	<%
		}//for
	%>
		<hr>
	<%
	}//for
	%>
</body>
</html>