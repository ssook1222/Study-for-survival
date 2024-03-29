<%@ page language="java"
         contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="menu_access" value="${menu_access}" />

<html>
	<head>
		<title>Home</title>
		<meta charset="UTF-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="shortcut icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
		<link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
		
		<link rel="stylesheet" href="${path}/resources/css/home.css" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	</head>
	<body>
		<script type="text/javascript">
		 	$( document ).ready( function() {
		 		if("${menu_access}"==""){
		 			$("#guide").show();
		 		}
		 		
		 		if("${menu_access}"=="0"){
		 			$("#admin-menu").show();
		 		}
		 		
		 		if(window.location.href=="http://localhost/kico/login/check"){
		 			window.location.href='http://localhost/kico';
		 		}
		 		
				if("${messageFromServer}"=="success"){
					$("#signupBtn").hide();
					$("#loginBtn").hide();
					$("#member_name").show();
					$("#logoutBtn").show();
				}
		 	})
		</script>
		<table style="height:100%" class="table table-borderless">
			<td style="width:30%; height:100%">
				<div id="side-bar" class="bg-light" style="height:100%">
				<div class="container">
					<h1><a id="logo" href="${pageContext.request.contextPath}">Home</a></h1>
					<a id="loginBtn" class="btn btn-secondary" style="margin-right:10px" href="${pageContext.request.contextPath}/login/form">로그인</a>
					<a id="signupBtn" class="btn btn-secondary" href="${pageContext.request.contextPath}/signup/form">회원가입</a>
					<h6 id="member_name" style="margin-top:10px; display: none">환영합니다. ${member_name}님!</h6>
					<a id="logoutBtn" class="btn btn-secondary" style="margin-top:10px; display: none"
					href="${pageContext.request.contextPath}/logout"
					>로그아웃</a>
					<hr>
					<h3 class="title">게시판</h3>
					<table class="table table-hover table-borderless">
						<!-- 게시판 메뉴 목록이 들어와 있어야 함. -->
						<c:forEach var="dto" items="${menu_list}">
						<c:if test="${dto.menuaccess>=menu_access}">
							<td>
								<a href="${pageContext.request.contextPath}/select_all_menu/detail?mno=${dto.menuno}" 
								style="text-decoration:none; color:black"
								>
									<h5>
										${dto.menuname}					
									</h5>
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
				<div id="admin-menu" style="display:none">
					<br>
						<a class="btn btn-outline-secondary btn-sm" data-toggle="collapse" href="#multiCollapseExample1" role="button" 
						   style="margin-bottom:10px; width:100%; paading:10px"
						   aria-expanded="false" aria-controls="multiCollapseExample1">
						  	<h5><b>관리자 메뉴</b></h5>
						</a>	
					<div class="row">
					  <div class="col">
					    <div class="collapse multi-collapse" id="multiCollapseExample1">
					      <div class="card card-body">
					      	<div class="raw">
					      		<div class="col">
					      			<a type="button" class="btn btn-light" style="width:33%" href="${pageContext.request.contextPath}/admin/board">게시판 관리</a>
					        		<a type="button" class="btn btn-light" style="width:33%" href="${pageContext.request.contextPath}/admin/member">회원 관리</a>
					        		<a type="button" class="btn btn-light" style="width:33%" href="${pageContext.request.contextPath}/admin/group">회원 그룹 관리</a>
					      		</div>
					      	</div>
					      </div>
					    </div>
					  </div>
					</div>
					<hr>
				</div>
				
				<div id="board-list" class="container">
				<h1>최신 글</h1>
				<hr>
				<table class="table table-hover table-borderless">
						<!-- 최신글 목록이 들어와 있어야 함. -->
								<small id="guide" style="display:none;">로그인을 하셔야 확인이 가능합니다.</small>
								<c:forEach var="dto" items="${board_list}">
									<c:if test="${dto.menuaccess>=menu_access}">
									<td>
										<td>
											<a 
												style="text-decoration:none; color:black"
												href="${pageContext.request.contextPath}/select_all_board/detail?bno=${dto.bno}&mno=${dto.menuno}">
												<small>${dto.btitle}</small>	
											</a>
										</td>
										<td>
											<a 
												style="text-decoration:none; color:black"
												href="${pageContext.request.contextPath}/select_all_board/detail?bno=${dto.bno}&mno=${dto.menuno}">
												<small>작성날짜 : ${dto.bdate}</small>	
											</a>
										</td>	
									</td>	
									<tr></tr>
								</c:if>
							</c:forEach>
						
				</table>
			</div>
			</td>
		
		</table>

	</body>
</html>
