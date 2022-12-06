<%@page import="java.util.ArrayList"%>
<%@page import="servlet.DeptDTO"%>
<% %>
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
		<h1>2. request 받고, setAttribute, Dispatcher</h1>
		<%= request.getParameter("mid") %>
		<%= request.getParameter("mname") %>
		<%-- httpServlet.request.getParameter는 내장객체로, 이미 만들어저 있다. --%>
		<%-- 서블릿으로 만들어서 사용할 수 있게끔 미리 만들어서 던져줌 --%>
		
		<%-- 데이터를 전달해보자! --%>
		<% 
		request.setAttribute("StringObj","It's too cold"); 
		//어떤 오브젝트도 setAttribute를 통해 집어넣을 수 있음.
		
		DeptDTO dto = new DeptDTO();
		dto.setDeptno("01");
		dto.setDname("solution");
		request.setAttribute("GeneralObj",dto); 
		//DTO - general obj도 쉽게 담을 수 있음.
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("white");
		list.add("purple");
		list.add("grey");
		request.setAttribute("ListObj",list);
		//list object같은 자료구조도 request안에 쉽게 담을 수 있음.
		
		RequestDispatcher disp = request.getRequestDispatcher("./04requset_setAttribute3.jsp");
		//RequestDispatcher로 리퀘스트를 보낼 수 있음. include와 forward가 여기에 해당.
		disp.include(request, response);
		disp.forward(request, response);
		//include나 forward를 통해서 데이터를 넘길 수 있음
		//include는 파일의 내용들을 복사해서 삽입 후 컴파일하는 형태
		//forward는 권한을 그 쪽으로 넘겨버리는 형태
		
		%>
		
		
	</body>
</html>