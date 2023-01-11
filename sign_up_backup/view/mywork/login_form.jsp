<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login_form</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<style type="text/css">
			.form-round{
				border-radius: 1rem;
			}
			#mid, #mpwd{
				width:100%; 
			}
			#writeBtn{
				width:10%;
			}
		</style>
		
	</head>
	<body class="text-center bg-light">
		<script type="text/javascript">
			$(document).ready(function(){
				$("#writeBtn").click(function() {
					$.get(
							"${pageContext.request.contextPath}/login/check"
							, {
								mid : $("#mid").val(),
								mpwd : $("#mpwd").val()
							}
							, function(data, status) {
								if(data > 0) {
									$(location).attr('href', '${pageContext.request.contextPath}/board/select_all_board');
								} else {
									alert("로그인에 실패하셨습니다.")
								}
							}//function
					);
				});//click
			}); //ready
		</script>		
		<main class="form-signin w-100 m-auto">
		  <form>
		    <div class="py-5 text-center">
				<img class="d-block mx-auto mb-4" 
				src="https://www.businesspost.co.kr/news/photo/202111/20211118160955_18536.jpg" 
				alt="" width="120" height="72">
				<h2>Login</h2>
			</div>
		
		   <div class="container px-4 px-lg-5">
				<div class="justify-content-center">
					<form id="form1">
						<table class="table table-hover">
							<tr>
								<td>
									<div style="display:flex">
										<input  type="text" id="mid" name="mid" 
												class="form-control form-round form-control-user" 
												maxlength="7" placeholder="Member ID">
									</div>
								</td>
							</tr>
							<tr>
								<td><input type="password" id="mpwd" name="mpwd" class="form-control form-round" maxlength="7" placeholder="Member Password">
								</td>
							</tr>
						</table>
						<button id="writeBtn" type="button" class = "btn btn-secondary d-block mx-auto mb-4 form-round">Login</button>
					</form>
					<hr>
					<div class="text-center">
						<small>If you don't have account...</small>
						<br>
						<small><a href="/kico/sign-up/form">Sign-up</a><br></small>
						<small class="mt-5 mb-3 text-muted">&copy; 2017–2022</small>
					</div>
				</div>
			</div>
		
		</main>
		
	</body>
</html>