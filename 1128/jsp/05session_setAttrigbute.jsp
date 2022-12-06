<%@page import="java.util.ArrayList"%>
<%@page import="servlet.DeptDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05session_setAttribute</title>
</head>
<body>
	<h1>setAttribute</h1>
	
	<%
	session.setAttribute("StringObj","It's too cold"); 
	// session.setAttribute(name,object); 
	// 원하는 객체를 넣어두면 됨.
	
	
	
	DeptDTO dto = new DeptDTO();
	dto.setDeptno("01");
	dto.setDname("solution");
	session.setAttribute("GeneralObj",dto); 
	
	ArrayList<String> list = new ArrayList<String>();
	list.add("white");
	list.add("purple");
	list.add("grey");
	session.setAttribute("ListObj",list);
	%>
	
</body>
</html>