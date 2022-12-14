<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_access" value="${menu_access}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>menuDetail</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
		<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
		
		<style>
			html{
				height:100%;
			}
			body{
				font-family: 'IBM Plex Sans KR', sans-serif;
				width:100%
			}
			
			#logo{
				text-decoration:none;
				color:black;
			}
			
			.title{
				font-weight:bold;
			}
			
			#signBtn{
				float:right
			}
			
			#loginBtn{
				float:left
			}
			
		</style>
		
	</head>
	
	<body style="height:100%">
		<script type="text/javascript">
		$(document).ready(function(){
			const urlParams = new URL(location.href).searchParams;
			const name = urlParams.get('mno');
			$("#"+"menu"+name).css("font-weight","bold")
			
			if("${messageFromServer}"=="success"){
				$("#signupBtn").hide();
				$("#loginBtn").hide();
				$("#member_name").show();
				$("#logoutBtn").show();
			}
			
			else{
				$("#boardWrite").hide();
				$("#tmp").hide();
			}
		})
		</script>
		
		<table class="table table-borderless" style="height:100%">
			<td style="width:30%; height:100%">
				<div id="side-bar" class="bg-light" style="height:100%">
					<div class="container">
						<h1><a id="logo" href="${pageContext.request.contextPath}">Home</a></h1>
						<a id="loginBtn" class="btn btn-secondary" style="margin-right:10px" href="${pageContext.request.contextPath}/login/form">?????????</a>
						<a id="signupBtn" class="btn btn-secondary" href="${pageContext.request.contextPath}/signup/form">????????????</a>
						<h6 id="member_name" style="margin-top:10px; display: none">???????????????. ${member_name}???!</h6>
						<a id="logoutBtn" class="btn btn-secondary" style="margin-top:10px; display: none"
						href="${pageContext.request.contextPath}/logout"
						>????????????</a>
						<hr>
						<h3 class="title">?????????</h3>
						<table class="table table-hover table-borderless">
							<!-- ????????? ?????? ????????? ????????? ????????? ???. -->
							<c:forEach var="dto" items="${menu_list}">
								<c:if test="${dto.menuaccess>=menu_access}">
									<td>
										<a href="${pageContext.request.contextPath}/select_all_menu/detail?mno=${dto.menuno}" 
										style="text-decoration:none; color:black"
										>
											<h5 id="menu${dto.menuno}">${dto.menuname}</h5>
										</a>
									</td>
									<tr></tr>
								</c:if>
						</c:forEach>
						</table>
					</div>
				</div>
			</td>
				
			<td>
				<div id="board-list" class="container">
					<!-- ????????? ????????? ????????? ???. -->
					<table class="table table-hover table-borderless">
					<h1>?????? ???</h1>
					<a id="boardWrite" type="button" class="btn btn-secondary" style="float:right" href="${pageContext.request.contextPath}/write-board">?????????</a>
					<div id="tmp" style="height:50px"></div>
					<hr>
					<tr>
						<c:forEach var="dto" items="${board_list}" varStatus="status">
							<td>
								<a href="${pageContext.request.contextPath}/select_all_board/detail?bno=${dto.bno}&mno=${dto.menuno}"
								   style="text-decoration:none; color:black"
								>
									<small>${dto.btitle}</small>
								</a>
							</td>
							<td>
								<a 
									
									style="text-decoration:none; color:black"
									href="${pageContext.request.contextPath}/select_all_board/detail?bno=${dto.bno}&mno=${dto.menuno}">
									<small>???????????? : ${dto.bdate}</small>	
								</a>
							</td>
							<tr></tr>
						</c:forEach>
					</tr>						
			</table>
				</div>
			</td>
		</table>
		
	</body>
</html>