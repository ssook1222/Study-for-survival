<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="newBee" tagdir = "/WEB-INF/tags" %>
<%-- jstl도 이걸로 만들어짐, 태그 라이브러리 --%>
<%-- prefix = 경로(tag-dir)를 대체하는 느낌, prefix는 태그의 이름 같은 느낌
tagdir = 태그 디렉터리--%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>12custom_tag1.jsp</title>
	</head>
	<body>
		<newBee:tag1 />
		<newBee:tag2 stringInput="냠냠" colorChoose="red"></newBee:tag2>
		<newBee:tag3 
			id="apple" 
			name="steve"
			age="28"
			addr="south korea"
			></newBee:tag3>
			<!-- name, value 쌍인 맵 형태로 출력됨 -->
	</body>
</html>