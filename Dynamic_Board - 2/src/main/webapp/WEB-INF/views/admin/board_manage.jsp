<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_access" value="${menu_access}" />
<c:set var="group_list_size" value="${group_list_size}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Board-Manage</title>
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
				
			</Style>	
	</head>
	
	<body style="height:100%" class="bg-light">
		<script type="text/javascript">
		 	$( document ).ready( function() {
		 		$("#menuname").val("${menuname}");
		 		
		 		$("#updateBtn").click(function() {
		 			
					if($.trim($("#menuname").val())==""){ 
						alert("변경할 게시판 제목을 입력해주세요");
						return; //수행 중지
					}

					$.post(
							"${pageContext.request.contextPath}/admin/board/update/data"
							, {
								menuno : ${menuno},
								menuname : $("#menuname").val(),
								menuaccess: $("#test option:selected").val(),
								
							}
							, function(data, status) {
								console.log(status)
								console.log(data)
								if(status == 'success') {
									alert("게시판 변경이 완료되었습니다.")
									$(location).attr('href', '${pageContext.request.contextPath}');
								} else {
									alert("게시판 변경에 실패하였습니다.")
								}
							}//function
					);
				});//click
				
				$("#deleteBtn").click(function() {

					$.post(
							"${pageContext.request.contextPath}/admin/board/delete/data"
							, {
								menuno : ${menuno}
							}
							, function(data, status) {
								console.log(status)
								console.log(data)
								if(status == 'success') {
									alert("게시판 삭제가 완료되었습니다.")
									$(location).attr('href', '${pageContext.request.contextPath}');
								} else {
									alert("게시판 변경에 실패하였습니다.")
								}
							}//function
					);
				});//click
				
		 	})
		 	
		 	
		</script>
		<div style="width:80%; margin:auto; padding:1%">
			<table class="table table-borderless">
					<hr>
					<tr>
						<h2>${menuname}</h2> 
						게시판 설정변경
						<hr>
					</tr>
					<tr>
						<td>	
							현재 게시판 조회 가능 그룹 :
							<b> 
							${mgname}
							</b>
						</td>
					</tr>
					<tr>
						<td id="board-type">
							게시판 조회/수정 가능 그룹 : 
							<select id="test" name="test" class="form-control" style="width:30%; display:inline-block"> 
								<c:forEach var="dto" items="${group_list}">
								   	<option class="dropdown-item" value="${dto.mgno}">${dto.mgname}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label for="exampleFormControlInput1" class="form-label">게시판 이름</label>
  							<input type="text" class="form-control" id="menuname" name="menuname" maxlength="20" placeholder="수정할 게시판 제목을 입력해주세요.">		
						</td>
					</tr>
					<tr>
						<td>
							<button id="deleteBtn" type="button" class="btn btn-danger" style="display:inline-block; margin-left:10px; float: right;">
								게시판 삭제하기
							</button>
							
							<button id="updateBtn" type="button" class="btn btn-secondary" style="display:inline-block; float: right;">
								게시판 수정하기
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
			</div>
		
	</body>
</html>