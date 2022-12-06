<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%-- 리퀘스트를 보내주는 것, 발생시키는 것, 받는 것 총 3개의 파일이 필요 --%>
		<meta charset="UTF-8">
		<title>04requset_setAttribute1.jsp</title>
	</head>
	<body>
		<h1>1. request 발생</h1>
		<form method="get" action="./04request_setAttribute2.jsp">
			<input type="text" id="mid" name="mid">
			<%-- 멤버의 아이디 --%>
			<input type="text" id="mname" name="mname">
			<%-- 멤버의 이름 --%>
			<button type="submit"> data send </button>
			<%-- 버튼은 기본이 submit --%>
		</form>
	</body>
</html>