<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%-- 리퀘스트를 보내주는 것, 발생시키는 것, 받는 것 총 3개의 파일이 필요 --%>
		<meta charset="UTF-8">
		<title>04requset_setAttribute3.jsp</title>
		<%-- 리퀘스트로 데이터를 보내서 받을 때에만 이를 사용할 수 있음.
		--%>
	</head>
	<body>
		<h1>3. getAttribute</h1>
		<%= request.getParameter("mid") %>
		<%= request.getParameter("mname") %>
		<%= request.getAttribute("StringObj") %>
		<%-- String은 바로 받을 수 있음 --%>
		<%= request.getAttribute("GeneralObj") %>
		<%-- GeneralObj에 toString이 적용되어 있으므로 결과가 바로 나옴 --%>
		<%= request.getAttribute("ListObj") %>
		<%-- ListObj에 toString이 적용되어 있으므로 결과가 바로 나옴 
		원래대로라면 for문 돌려서 끄집어 내야 함.
		--%>
	</body>
</html>