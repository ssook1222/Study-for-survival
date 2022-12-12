<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day2jstl7.jsp</title>
	</head>
	<body>
		<h1>c:import - 다른 페이지를 컴파일 후, 결과만 가져 온다.(변수 공유 안됨)</h1>
		<h2>include file="./header.jsp" - 다른 페이지를 복사해 온 후, 컴파일을 함께 한다.(변수 공유 됨)</h2>
		<hr>
		<h2>url="./day2jstl6.jsp" : day2jstl6.jsp의 실행 결과를 가져오는 표현.</h2>
		<h2>c:import 내부의 c:param은 day2jstl6.jsp로 보내는 data들을 정의한 것이다.</h2>
		<hr>
		<c:import url="./day2jstl6.jsp">
			<c:param name="bno" value="115" />
			<c:param name="btitle" value="holiday" />
			<c:param name="bwriter" value="ro" />
			<c:param name="bcnts" value="i want holiday" />
			<c:param name="bdate" value="08-15" />
		</c:import>
	</body>
</html>
















