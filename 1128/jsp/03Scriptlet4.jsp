<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04.Script_let.jsp</title>
</head>
<body>
	<table border = "1">
	<% 
	for(int i= 1; i<=10; i++){
	%>
	
		<tr>
		<% 
			for(int a=65; a<=65+25;a++){
		%>		
				<td><%= (char)a %></td>
		<%		
			}
		%>
		</tr>
	<% 
	}		
	%>
	</table>
	
</body>
</html>