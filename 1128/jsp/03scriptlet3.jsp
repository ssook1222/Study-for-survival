<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03.Script_let.jsp</title>
</head>
<body>
	<h1>Script let 구구단 in table</h1>
	<table border = "1">
	<%-- 굳이 문자열할 처리할 필요 없게 스크립트릿 사용하자 --%>
	<% 
		for(int dan = 2; dan<=9; dan++){
	%>		
			<tr>
	<%		
			for(int gop = 1; gop <=9 ; gop++){
	%>			
				<td>
				<%= dan %>*<%= gop %>=<%= (dan*gop) %>
				</td>
	<%		
			}//for
	%>		
			</tr>
	<%		
		}//for
	%>
	</table>
</body>
</html>