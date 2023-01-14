<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_access" value="${menu_access}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Group-admin</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="shortcut icon" href="http://localhost/kico/resources/favicon.ico" type="image/x-icon"/>
		<link rel="icon" href="http://localhost/kico/resources/favicon.ico" type="image/x-icon"/>
		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
	
		<Style>
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
			</Style>	
	</head>
	
	<body style="height:100%">
		<script type="text/javascript">
		 	$( document ).ready( function() {
		 		
		 		var dup = true
		 		
				if("${messageFromServer}"=="success"){
					$("#signupBtn").hide();
					$("#loginBtn").hide();
					$("#member_name").show();
					$("#logoutBtn").show();
				}
				
				if("${menu_access}"=="0"){
		 			$("#admin-menu").show();
		 		}
				
				$("#dupCheck").click(function() {
					$.get(
							"${pageContext.request.contextPath}/admin/group/dupCheck"
							, {
								menuaccess : $("#test option:selected").val()
							}
							, function(data, status) {
								if(data > 0) {
									alert("할당 중인 우선순위입니다.")
									dup = true
								} else {
									alert("할당 가능한 우선순위입니다.")
									dup = false
								}
							}//function
					);
				})
				
				$("#writeBtn").click(function() {
					
					if($.trim($("#mgname").val())==""){ 
						alert("그룹 이름을 입력해주세요.");
						return; //수행 중지
					}
					
					console.log($("#mgname").val())
					
					if(dup==false){
						$.post(
								"${pageContext.request.contextPath}/admin/group/insert/data"
								, {
									mgname : $("#mgname").val(),
									menuaccess : $("#test option:selected").val()
								}
								, function(data, status) {
									if(status == 'success') {
										alert("그룹 추가에 성공하였습니다.")
										$(location).attr('href', '${pageContext.request.contextPath}');
									} else {
										alert("그룹 추가에 실패하였습니다.")
									}
								}//function
						);
					}
					else{
						alert("우선순위가 중복이거나, 중복 체크를 하지 않으셨습니다.")
					}
					
					
				});//click
		 	})
		</script>
		<table class="table table-borderless" style="height:100%">
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
			<td style="width:70%; height:100%">				
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
				<div>
					<h2>회원그룹 관리</h2>
					<br>
					<table class="table table-borderless">
							<tr>
								<td>
									<h5>그룹 이름</h5>
								</td>
								<td>
									<h5>현재 할당된 그룹 우선순위</h5>
								</td>
								<td>
									<h5>그룹 우선순위 변경</h5>
								</td>
							</tr>
							
							<c:forEach var="dto" items="${group_list}">
							<tr>
								<td style="width:25%;">
								<c:choose>
									<c:when test="${dto.mgname=='관리자'}"></c:when>
									<c:when test="${dto.mgname=='일반사용자'}"></c:when>
									<c:otherwise><p id="mname">${dto.mgname}</p></c:otherwise>
								</c:choose>	
								</td>
								<td style="width:25%;">
								<c:choose>
									<c:when test="${dto.mgname=='관리자'}"></c:when>
									<c:when test="${dto.mgname=='일반사용자'}"></c:when>
									<c:otherwise><p id="mname">${dto.menuaccess}</p></c:otherwise>
								</c:choose>		
								</td>
								<td style="width:50%;">
								<c:choose>
									<c:when test="${dto.mgname=='관리자'}"></c:when>
									<c:when test="${dto.mgname=='일반사용자'}"></c:when>
									<c:otherwise>
										<a type="button" id="update_btn" class="btn btn-secondary" 
									   href="${pageContext.request.contextPath}/admin/group/update?mgname=${dto.mgname}&mgno=${dto.mgno}&menuaccess=${dto.menuaccess}"
									   style="width:30%; display:inline-block">이동</a>
									</c:otherwise>
								</c:choose>	
								</td>
									<tr></tr>
							</tr>
							</c:forEach>
						</table>
						<hr>
						<a type="button" class="btn btn-light" style="width:100%" data-toggle="modal" data-target="#exampleModal">회원 그룹 추가하기</a>
				</div>
			</td>
		</table>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">추가할 그룹 설정</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<h6 style="margin-top:5px; margin-bottom:15px">추가할 그룹의 이름을 설정해주세요.</h6>
		        <input type="text" class="form-control" id="mgname" name="mgname" maxlength="20" placeholder="그룹의 이름을 입력하세요.">
		        <hr>
		        <h6 style="margin-top:15px; margin-bottom:15px">추가할 그룹의 우선순위를 설정해주세요.</h6>
		        <select id="test" name="test" class="form-control" style="width:30%; display:inline-block"> 
					<c:forEach var="dto" items="${access_list}">
						<c:choose>
							<c:when test="${dto.menuaccess==0}"></c:when>
							<c:when test="${dto.menuaccess==1}"></c:when>
							<c:otherwise>
								<option class="dropdown-item" value="${dto.menuaccess}">${dto.menuaccess}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<a type="button" id="dupCheck" class="btn btn-outline-secondary">우선순위 중복 체크</a>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
		        <button id="writeBtn" type="button" class="btn btn-secondary">그룹 새로 생성하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>