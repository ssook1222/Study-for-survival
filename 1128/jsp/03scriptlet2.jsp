<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03script_let2.jsp</title>
</head>
<body>
	<h1>Script Let in Table</h1>
	<table border = "1">
	<%
		for(int i=0; i<=10; i++){
	%>
			
			<tr>
				<td>
					<%=i %>
				</td>
			</tr>
	<%	
		}
	%>
	</table>
</body>
</html>