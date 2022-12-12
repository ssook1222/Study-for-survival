<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first_test</title>
</head>
<body>
	<h1>first_test</h1>
	<!-- <h1>${emp_list}</h1> -->
	<c:forEach var="one_dto" items="${emp_list}">
		<hr>
		${one_dto.empno}	${one_dto.ename}	${one_dto.job}	${one_dto.mgr}
		${one_dto.hiredate}	${one_dto.sal}	${one_dto.comm}	${one_dto.deptno}
	</c:forEach>
</body>
</html>
