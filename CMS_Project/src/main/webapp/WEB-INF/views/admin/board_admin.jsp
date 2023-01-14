<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_access" value="${menu_access}" />
<c:set var="group_list_size" value="${group_list_size}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Board-admin</title>
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
		 		
				if("${messageFromServer}"=="success"){
					$("#signupBtn").hide();
					$("#loginBtn").hide();
					$("#member_name").show();
					$("#logoutBtn").show();
				}
				
				if("${menu_access}"=="0"){
		 			$("#admin-menu").show();
		 		}
				
				$("#writeBtn").click(function() {
					
					if($.trim($("#mname").val())==""){ 
						alert("게시판 이름을 입력해주세요.");
						return; //수행 중지
					}
					
					console.log($("#mname").val())
					
					$.post(
							"${pageContext.request.contextPath}/admin/board/insert/data"
							, {
								menuname : $("#mname").val()
							}
							, function(data, status) {
								if(status == 'success') {
									alert("게시판 추가에 성공하였습니다.")
									$(location).attr('href', '${pageContext.request.contextPath}');
								} else {
									alert("게시판 추가에 실패하였습니다.")
								}
							}//function
					);
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
					<h2>게시판 관리</h2>
					<hr>
					<table class="table table-borderless">
						<tr>
							<td>
								<h5>게시판</h5>
							</td>
							<td>
								<h5>현재 접근권한을 가진 그룹</h5>
							</td>
							<td>
								<h5>게시판 수정/삭제하기</h5>
							</td>
						</tr>
						<c:forEach var="dto" items="${board_list}"> <!-- varStatus="status" -->
								<td style="width:25%;">
									${dto.menuname} 
								</td>
								<td style="width:30%;">
									<b>${dto.mgname} </b> 그룹 권한 이상
								</td>
								<td style="width:50%;">
									<div style="float:right; width:60%">
										
									</div>
									
									<a type="button" id="update_btn" class="btn btn-secondary" 
									   href="${pageContext.request.contextPath}/admin/board/update?menuno=${dto.menuno}&mgname=${dto.mgname}&mgno=${dto.mgno}&menuname=${dto.menuname}"
									   style="width:30%; display:inline-block">이동</a>	
								</td>
								<tr></tr>
						</c:forEach>
					</table>
					<hr>
					<a type="button" class="btn btn-light" style="width:100%" data-toggle="modal" data-target="#exampleModal">게시판 추가하기</a>
					
					<small><p style="text-align:center; margin-top:10px">게시판 추가 시, 기본 접근 권한은 중간 단계 수준으로 맞춰져 있으며 해당 페이지에서 변경 가능합니다.</p></small>
				</div>
			</td>
		</table>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">추가할 게시판의 이름을 입력해주세요.</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <input type="text" class="form-control" id="mname" name="mname" maxlength="20" placeholder="게시판 이름을 입력하세요.">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
		        <button id="writeBtn" type="button" class="btn btn-secondary">게시판 새로 생성하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>