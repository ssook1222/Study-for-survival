<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_access" value="${menu_access}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>New Board</title>
		
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
			const name = urlParams.get('bno');
			
			if("${messageFromServer}"=="success"){
				$("#signupBtn").hide();
				$("#loginBtn").hide();
				$("#member_name").show();
				$("#logoutBtn").show();
			}
			
			if("${update_yn}"==""){
				$("#updateBtn").hide();
			}
			
			
			if("${update_yn}"=="yes"){
				$("#insBtn").hide();
				$("#form-title").text("글 수정하기");
				$("#btitle").val("${detail_dto.btitle}");
				$("#bcnts").val("${detail_dto.bcnts}");
			}
			
			$("#insBtn").click(function() {
				
				if($.trim($("#btitle").val())==""){ 
					alert("게시글 제목을 입력해주세요");
					return; //수행 중지
				}
				
				
				if($.trim($("#bcnts").val())==""){ 
					alert("게시글을 입력해주세요");
					return; //수행 중지
				}

				$.post(
						"${pageContext.request.contextPath}/write-board/insert"
						, {
							btitle : $("#btitle").val(),
							bcnts : $("#bcnts").val(),
							menuno: $("#test option:selected").val(),
							mno: ${mno}
							
						}
						, function(data, status) {
							console.log(status)
							console.log(data)
							if(status == 'success') {
								$(location).attr('href', '${pageContext.request.contextPath}');
							} else {
								alert("게시글 작성에 실패하였습니다.")
							}
						}//function
				);
			});//click
			
			$("#updateBtn").click(function() {
				
				if($.trim($("#btitle").val())==""){ 
					alert("게시글 제목을 입력해주세요");
					return; //수행 중지
				}
				
				
				if($.trim($("#bcnts").val())==""){ 
					alert("게시글을 입력해주세요");
					return; //수행 중지
				}

				$.post(
						"${pageContext.request.contextPath}/update/board"
						, {
							btitle : $("#btitle").val(),
							bcnts : $("#bcnts").val(),
							menuno: $("#test option:selected").val(),
							bno: name
							
						}
						, function(data, status) {
							console.log(status)
							console.log(data)
							if(status == 'success') {
								$(location).attr('href', '${pageContext.request.contextPath}');
							} else {
								alert("게시글 작성에 실패하였습니다.")
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
							<!-- 게시판 메뉴 목록이 들어와 있어야 함. 권한 별로 보이게끔 mapper 수정해두기 -->
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
				<table class="table table-borderless">
				<h1 id="form-title">최신 글</h1>
					<hr>
					<tr>
						<td id="board-type">
							작성할 게시판 : 
							<select id="test" name="test" class="form-control" style="width:30%; display:inline-block"> 
								<c:forEach var="dto" items="${menu_list}">
									<c:if test="${dto.menuaccess>=menu_access}">
								   		<option class="dropdown-item" value="${dto.menuno}">${dto.menuname}</option>
								   	</c:if>	
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label for="exampleFormControlInput1" class="form-label">글 제목</label>
  							<input type="text" class="form-control" id="btitle" name="btitle" maxlength="20" placeholder="게시글 제목을 입력해주세요.">		
						</td>
					</tr>
					<tr>
						<td>
							<label for="exampleFormControlInput1" class="form-label">게시글 내용</label>
  							<textarea class="form-control" id="bcnts" name="bcnts" maxlength="500" placeholder="게시글 내용을 입력해주세요."></textarea>		
						</td>
					</tr>
					<tr>
						<td>
							<button id="insBtn" type="button" class="btn btn-secondary" style="display:inline-block; float: right;">
								글 작성하기
							</button>
							<button id="updateBtn" type="button" class="btn btn-secondary" style="display:inline-block; float: right;">
								글 수정하기
							</button>
							<a 
							href="javascript:history.back()"
							id="listBtn" type="button" class="btn btn-secondary" 
							style="display:inline-block; float: left;">
								목록
							</a>
						</td>
					</tr>							
				</table>
			</td>
			
		</table>	
		
	</body>
</html>