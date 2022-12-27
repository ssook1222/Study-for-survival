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
		 		$("#mgname").val("${mgname}");
		 		
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
		 		
		 		$("#updateBtn").click(function() {
		 			
					if($.trim($("#mgname").val())==""){ 
						alert("변경할 게시판 제목을 입력해주세요");
						return; //수행 중지
					}

					if(dup==false){
						$.post(
								"${pageContext.request.contextPath}/admin/group/update/data"
								, {
									mgno : ${mgno},
									mgname : $("#mgname").val(),
									menuaccess: $("#test option:selected").val(),
									mid: ${menuaccess}
									
								}
								, function(data, status) {
									console.log(status)
									console.log(data)
									if(status == 'success') {
										alert("그룹 설정 변경이 완료되었습니다.")
										$(location).attr('href', '${pageContext.request.contextPath}');
									} else {
										alert("그룹 설정 변경에 실패하였습니다.")
									}
								}//function
						);
					}
					
					else{
						alert("우선순위가 중복이거나, 중복 체크를 하지 않으셨습니다.")
					}
					
				});//click
				
				$("#deleteBtn").click(function() {

					$.post(
							"${pageContext.request.contextPath}/admin/group/delete/data"
							, {
								mgno : ${mgno},
								mid: ${menuaccess}
							}
							, function(data, status) {
								console.log(status)
								console.log(data)
								if(status == 'success') {
									alert("그룹 삭제가 완료되었습니다.")
									$(location).attr('href', '${pageContext.request.contextPath}');
								} else {
									alert("그룹 삭제에 실패하였습니다.")
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
						<h2>${mgname}</h2> 
						그룹 설정변경
						<hr>
					</tr>
					<tr>
						<td>	
							현재 해당 그룹의 우선 순위 :
							<b> 
							${menuaccess}
							</b>
							<br>
							<small style="color:gray">우선 순위가 0에 가까울수록 제일 높은 접근 권한을 갖게 됩니다.</small>
						</td>
					</tr>
					<tr>
						<td id="board-type">
							변경 그룹 우선순위 : 
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
							<a type="button" id="dupCheck" class="btn btn-secondary">우선순위 중복 체크</a>
						</td>
					</tr>
					<tr>
						<td>
							<label for="exampleFormControlInput1" class="form-label">그룹 이름</label>
  							<input type="text" class="form-control" id="mgname" name="mgname" maxlength="20" placeholder="수정할 그룹 이름을 입력해주세요.">		
						</td>
					</tr>
					<tr>
						<td>
							
							<button id="deleteBtn" type="button" class="btn btn-danger" style="display:inline-block; margin-left:10px; float: right;">
								그룹 삭제하기
							</button>
							
							<button id="updateBtn" type="button" class="btn btn-secondary" style="display:inline-block; float: right;">
								그룹 수정하기
							</button>
							<a 
							href="javascript:history.back()"
							id="listBtn" type="button" class="btn btn-secondary" 
							style="display:inline-block; float: left;">
								목록
							</a>
							<div style="height:50px"></div>
							<small style="display:inline-block; margin-left:10px; float: right;">그룹을 삭제할 경우 그 그룹 내 회원들은 일반사용자 그룹으로 이동합니다.</small>
						</td>
					</tr>						
				</table>
			</div>

	</body>
</html>