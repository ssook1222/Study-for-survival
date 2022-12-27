<%@ page language="java"
         contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="menu_access" value="${menu_access}" />
<c:set var="member_name" value="${member_name}" />
<c:set var="member_no" value="${mno}" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Detail</title>
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
		
		function del_onClick() {
			alert("�� ������ �Ϸ�Ǿ����ϴ�.")
			window.location.href='http://localhost/${pageContext.request.contextPath}/delete/board?bno=${detail_dto.bno}';
		}
		
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
		})
		</script>
	
	
		<table class="table table-borderless" style="height:100%">
			<td style="width:30%; height:100%">
				<div id="side-bar" class="bg-light" style="height:100%">
					<div class="container">
						<h1><a id="logo" href="${pageContext.request.contextPath}">Home</a></h1>
						<a id="loginBtn" class="btn btn-secondary" style="margin-right:10px" href="${pageContext.request.contextPath}/login/form">�α���</a>
						<a id="signupBtn" class="btn btn-secondary" href="${pageContext.request.contextPath}/signup/form">ȸ������</a>
						<h6 id="member_name" style="margin-top:10px; display: none">ȯ���մϴ�. ${member_name}��!</h6>
						<a id="logoutBtn" class="btn btn-secondary" style="margin-top:10px; display: none"
						href="${pageContext.request.contextPath}/logout"
						>�α׾ƿ�</a>
						<hr>
						<h3 class="title">�Խ���</h3>
						<table class="table table-hover table-borderless">
							<!-- �Խ��� �޴� ����� ���� �־�� ��. -->
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
					<!-- �Խñ� ������ �־�� ��. -->
					<table class="table table-borderless">
					<tr>
						<td>
							<h3>${detail_dto.btitle}</h3>
							
							<b>${detail_dto.bno}</b> <i>th text</i> 
							<i>on</i> <b>${detail_dto.bdate}</b>
							<hr>
							<h4>${detail_dto.bcnts}</h4>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/select_all_menu/detail?mno=${detail_dto.menuno}" 
							   class="btn btn-secondary">���</a>
						</td>
						<td>
							<c:if test="${detail_dto.mname==member_name || member_no==0}">
								<a class="btn btn-danger" 
									onClick=del_onClick()>����</a>
								<a class="btn btn-secondary" href="${pageContext.request.contextPath}/update/board/form?bno=${detail_dto.bno}&mno=${detail_dto.mno}">����</a>
							</c:if>	
						</td>
					</tr>
					</table>
				</div>
			</td>
			
		</table>
		<div>
					
		</div>	
	</body>
</html>