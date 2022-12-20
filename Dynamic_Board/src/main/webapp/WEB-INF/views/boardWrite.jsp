<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>boardWrite</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
		
		<style>
    	html{
    	height:100%;
    	}
    	body {
        font-family: 'IBM Plex Sans KR', sans-serif;
        width:100%;
        height:100%;
        }
        #side-bar{
        	width:30%;
        	height:100%;
        	display:inline-block
        }     
        #board-list{
        	width:65%;
        	height:100%;
        	display:inline-block
        }
        .title{
        	display:inline-block
        }
        #board-plus:hover{
        	background-color:#d2d2d2;
        }
        #pencil-edit:hover{
        	background-color:#d2d2d2;
        }
        button{
        	display:inline-block
        	padding: 0;
			border: none;
			background: none;
        }
        a{
	        color:black
	    }
    </style>
	</head>
	
	<body>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#writeBtn").click(function() {
					
					if($.trim($("#mname").val())==""){ 
						alert("게시판 이름을 입력해주세요");
						return; //수행 중지
					}

					$.get(
							"${pageContext.request.contextPath}/insert"
							, {
								mname : $("#mname").val()
							}
							, function(data, status) {
								if(data > 0) {
									$(location).attr('href', '${pageContext.request.contextPath}');
								} else {
									alert("게시판 추가에 실패하였습니다.")
								}
							}//function
					);
				});//click
				
				$("#insBtn").click(function() {
					
					if($.trim($("#btitle").val())==""){ 
						alert("게시글 제목을 입력해주세요");
						return; //수행 중지
					}
					
					if($.trim($("#bwriter").val())==""){ 
						alert("작성자를 입력해주세요");
						return; //수행 중지
					}
					
					if($.trim($("#bpwd").val())=="" ){ 
						alert("비밀번호를 입력해주세요");
						return; //수행 중지
					}
					
					if($.trim($("#bcnts").val())==""){ 
						alert("게시글을 입력해주세요");
						return; //수행 중지
					}
	
					$.post(
							"${pageContext.request.contextPath}/insert/board-data"
							, {
								mno: $("#test option:selected").val(),
								btitle : $("#btitle").val(),
								bwriter : $("#bwriter").val(),
								bpwd : $("#bpwd").val(),
								bcnts : $("#bcnts").val(),
								
							}
							, function(data, status) {
								console.log(status)
								if(status == 'success') {
									$(location).attr('href', '${pageContext.request.contextPath}');
								} else {
									alert("게시글 작성에 실패하였습니다.")
								}
							}//function
					);
				});//click
				
			}); //ready
		</script>
	<div id="side-bar" class="bg-light">
		<div class="container">
			<h1><a id="logo" style="text-decoration:none" href="${pageContext.request.contextPath}">HOME</a></h1>
			<hr>
			<h3 class="title" style="width:80%; margin-bottom:0">게시판</h3>
			<button type="button" data-toggle="modal" data-target="#exampleModal">
					<svg xmlns="http://www.w3.org/2000/svg" id="board-plus"
					width="32" height="32" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
	  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	  				<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
					</svg>
			</button>

			<hr>
			
			<table class="table table-hover table-borderless">
					<c:forEach var="dto" items="${text_list}">
						<tr>
							<td>
								<h5 class="title">
									<a href="${pageContext.request.contextPath}/select_all_menu/detail?mno=${dto.mno}">
										${dto.mname}
									</a>
								</h5>	
							</td>
						</tr>
					</c:forEach>
			</table>
		</div>
	</div>
	
	<!-- 작성 폼 추가하기 -->
	<div style="display:inline-block; width:65%" class="container">
		<table class="table table-borderless">
				<h1>최신 글</h1>
					<hr>
					<tr>
						<td>
							작성할 게시판 : 
							<select id="test" name="test" class="form-control" style="width:30%; display:inline-block"> 
								<c:forEach var="dto" items="${text_list}">
								   <option class="dropdown-item" value="${dto.mno}">${dto.mname}</option>
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
							<label for="exampleFormControlInput1" class="form-label">작성자</label>
  							<input type="text" class="form-control" id="bwriter" name="bwriter" maxlength="10" placeholder="작성자를 입력해주세요.">		
						</td>
					</tr>
					<tr>
						<td>
							<label for="exampleFormControlInput1" class="form-label">비밀번호</label>
  							<input type="password" class="form-control" id="bpwd" name="bpwd" maxlength="10" placeholder="비밀번호를 입력해주세요.">		
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
							<button id="listBtn" type="button" class="btn btn-secondary" style="display:inline-block; float: left;">
								목록
							</button>
						</td>
					</tr>
											
		</table>
	</div>	
	</body>
</html>