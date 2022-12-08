<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>11use_bean_form.jsp</title>
		</head>
		<body>
		
			<!-- <form action = "./11user_bean1.jsp> -->
			<form action="./11use_bean2.jsp">
				아이디 : <input type="text" id="mid" name="mid">
				<hr>
				이름 : <input type="text" id="mname" name="mname">
				<hr>
				주소 : <input type="text" id="maddr" name="maddr">
				<hr>
				전화번호 : <input type="text" id="mtel" name="mtel">
				<hr>
				<button type="submit">data send</button>
			</form>
			
			
		
		</body>
</html>