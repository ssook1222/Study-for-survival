<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Home</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<div class="container">
			<h1>
				Hello world!  
			</h1>
			<P>  The time on the server is ${serverTime}. </P>
			<form method="get" action="./select_all_emp">
				<button type="submit"> 사원 목록 조회 </button>
			</form>
			<table class="table table-hover">
				
					
				<tr>
					<td><a href="${pageContext.request.contextPath}/file1/form">file1</a></td>
					<td><a href="${pageContext.request.contextPath}/file2/form">file2</a></td>
					<td><a href="${pageContext.request.contextPath}/file11/form">file11</a></td>
				</tr>
			
				<tr>
					<td><a href="${pageContext.request.contextPath}/json1">json1</a></td>
					<td><a href="${pageContext.request.contextPath}/json2">json2</a></td>
					<td><a href="${pageContext.request.contextPath}/json11">json11</a></td>
					<td><a href="${pageContext.request.contextPath}/json12">json12</a></td>
					<td><a href="${pageContext.request.contextPath}/json13">json13</a></td>
				</tr>
			
				<tr>
					<td> <a href="${pageContext.request.contextPath}/ajax1">Ajax1</a> </td>
					<td> <a href="${pageContext.request.contextPath}/ajax2">Ajax2</a> </td>
					<td> <a href="${pageContext.request.contextPath}/ajax3">Ajax3</a> </td>
					<td> <a href="${pageContext.request.contextPath}/ajax11">Page For Ajax11</a> </td>
					<td> <a href="${pageContext.request.contextPath}/ajax12">Page For Ajax12</a> </td>
				</tr>
				<tr>
					<td> <a href="${pageContext.request.contextPath}/el1">el1</a> </td>
					<td> <a href="${pageContext.request.contextPath}/el2">el2</a> </td>
					<td> <a href="${pageContext.request.contextPath}/el3">el3</a> </td>
				</tr>
				<tr>
					<td> <a href="${pageContext.request.contextPath}/jstl1">jstl1</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl2">jstl2</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl3">jstl3</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl4">jstl4</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl5">jstl5</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl6">jstl6</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl7">jstl7</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl8">jstl8</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl9">jstl9</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl10">jstl10</a> </td>
					<td> <a href="${pageContext.request.contextPath}/jstl11">jstl11</a> </td>
			</tr>
			</table>
		</div>
	</body>
</html>
