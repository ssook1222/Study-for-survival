<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07main_login.jsp</title>
</head>
<body>

Context Path : <%= application.getContextPath() %>
<%-- context path = 프로젝트 이름, jsp 경로는 폴더 밑으로 잡힘. --%>

	<%
		String loginID = (String) session.getAttribute("login_id");
		//강제 형변환 - 명시적 형변환
		if(loginID!=null && !loginID.trim().equals("")){ 
			//로그인 결과가 빈값도 아니고, null도 아닌 경우에는 로그인 성공으로 취급해라
			//문자열 메소드 중 공백 잘라냄. trim
			//trim : 공백을 잘라내주는 역할, hello     가 들어오면 hello가 결과로 나옴
			/* 안 되는 케이스
				hi everyone !! : 문자열 중간에 공백이 있는 케이스
				trim은 문자열 좌우에 있는 공백만 삭제해줌.
			*/
			
			//현재 로그인한 클라이언트(=웹 브라우저 기준)
			%>
			<h1><%= loginID%>님 환영합니다.</h1>
			<form method="get" action="<%= application.getContextPath() %>/Login07">
				<button type="submit">Log Out</button>
			</form>
			<%--get은  --%>
		<%	
		}else{ //로그인하지 않은 클라이언트

		%>	
		<form method="post" action="<%= application.getContextPath() %>/Login07">
		
		<input type="text" id="mid" name="mid">
		<input type="password" id="mpwd" name="mpwd">
		<button type="submit">log in</button>
		<%--무조건 버튼 누르면 전송되므로 주의해서 사용하기
		스프링은 경로가 상대적으로 안 중요하지만,
		jsp에서는 반드시 해줘야 함.
		프로젝트 밑, 경로 밑에 경로가 뿌려짐
		--%>
	</form>
	<%
			}
	%>
		


	

</body>
</html>