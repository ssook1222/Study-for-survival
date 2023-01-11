<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>signup_form</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
			.form-round{
				border-radius: 1rem;
			}
			#mpwd, #mname, #mpwd2{
				width:100%; 
			}
			#mid{
				width:81%; 
				margin-right:2%
			}
		</style>
	</head>
	<body class="bg-light">
		<div>
			<script type="text/javascript">
			$(document).ready(function(){
				$("#btn1").click(function() {
					$.get(
							"${pageContext.request.contextPath}/sign-up/dupCheck"
							, {
								mid : $("#mid").val()
							}
							, function(data, status) {
								if(data > 0) {
									alert("사용 중인 아이디입니다.")
								} else {
									alert("사용 가능한 아이디입니다.")
								}
							}//function
					);
				});//click
				
				$("#writeBtn").click(function(){
					//데이터 체크
					if($.trim($("#mid").val())==""){ 
						alert("멤버 아이디를 입력해주세요");
						return; //수행 중지
					}
					
					if($.trim($("#mpwd").val())==""){ 
						alert("멤버 패스워드를 입력해주세요");
						return; //수행 중지
					}
					
					if($.trim($("#mpwd2").val())!= $.trim($("#mpwd").val()) ){ 
						alert("비밀번호를 동일하게 입력해주세요.");
						return; //수행 중지
					}
					
					if($.trim($("#mname").val())==""){ 
						alert("멤버 이름을 입력해주세요");
						return; //수행 중지
					}
					
				
					let form = new FormData(document.getElementById("form1"));
					
					for (let item of form.entries()) {
                        console.log(item[0] + " : " + item[1]);
                    }
					
					$.ajax({ //자바스크립트 객체이기 때문에 중괄호를 사용
						type:"POST"
						, encType : "multipart/form-data"
						, url :"${pageContext.request.contextPath}/sign-up/insert"
						, data:form
						, processData : false
						, contentType : false
						, cache : false
						, success : function(result){
							if(result>0){
								alert("회원 가입되었습니다.");
								$(location).attr('href', 'http://localhost/kico');
							}
							else {
								alert("회원가입 실패. \n 관리자에게 문의 바랍니다.");
							}
							
						}//call back function
						, error : function(){
							alert("흑흑 실패 싫어");
						}//call back function
					});
				});//click
			}); //ready
			</script>
			
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4" 
				src="https://www.businesspost.co.kr/news/photo/202111/20211118160955_18536.jpg" 
				alt="" width="120" height="72">
				<h2>Member form</h2>
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
										<button type="button" id="btn1" class="btn btn-secondary form-round mr-1"> Duplication check </button>
									</div>
									<small id="passwordHelpBlock" class="form-text text-muted">
			  								Your ID must be 1-7 characters long.
									</small>
								</td>
							</tr>
							<tr>
								<td><input type="password" id="mpwd" name="mpwd" class="form-control form-round" maxlength="7" placeholder="Member Password">
								<small id="passwordHelpBlock" class="form-text text-muted">
			  						Your Password must be 1-7 characters long.
								</small>
								</td>
							</tr>
							<tr>
								<td><input type="password" id="mpwd2" name="mpwd2" class="form-control form-round" maxlength="7" placeholder="Member Password Confirm"></td>
							</tr>
							<tr>
								<td><input type="text" id="mname" name="mname" class="form-control form-round" maxlength="20" placeholder="Member Name">
								<small id="passwordHelpBlock" class="form-text text-muted">
			  						Your Name must be 1-7 characters long.
								</small>
								</td>
							</tr>
						</table>
						<button id="writeBtn" type="button" class = "btn btn-secondary d-block mx-auto mb-4 form-round">Create Your Account</button>
					</form>
					<hr>
					<div class="text-center">
						<small>If you have account...</small>
						<br>
						<small><a href="/kico/login/form">Login</a></small>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>