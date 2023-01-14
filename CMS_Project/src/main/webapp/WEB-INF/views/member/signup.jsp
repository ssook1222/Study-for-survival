<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign-UP</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="shortcut icon" href="http://localhost/kico/resources/favicon.ico" type="image/x-icon"/>
		<link rel="icon" href="http://localhost/kico/resources/favicon.ico" type="image/x-icon"/>
		
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
		</style>
		
	</head>
	
	<body class="bg-light" >
		<script type="text/javascript">
		var dup = true
		$(document).ready(function(){
			$("#btn1").click(function() {
				$.get(
						"${pageContext.request.contextPath}/dupCheck"
						, {
							mid : $("#mid").val()
						}
						, function(data, status) {
							if(data > 0) {
								alert("사용 중인 아이디입니다.")
								dup = true
							} else {
								alert("사용 가능한 아이디입니다.")
								dup = false
							}
						}//function
				);
			});//click
			
			$("#writeBtn").click(function(){
				//데이터 체크
				
				if($.trim($("#mname").val())==""){ 
					alert("게시판 이름을 입력해주세요");
					return; //수행 중지
				}

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
				
				if(dup==false){
					$.ajax({ //자바스크립트 객체이기 때문에 중괄호를 사용
						type:"POST"
						, encType : "multipart/form-data"
						, url :"${pageContext.request.contextPath}/sign-up"
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
				}
				else{
					alert("아이디가 중복이거나 중복 체크를 진행하지 않으셨습니다.");
				}
				
			});//click
		})
		</script>
	
			<div class="py-5 text-center">
				<h2>Member form</h2>
			</div>
			
			<div class="container px-4 px-lg-5">
				<div class="justify-content-center">
					<form id="form1">
						<table class="table">
							<tr>
								<td>
									<div style="display:flex">
										<input  style="width: 79%; margin-right:1%" type="text" id="mid" name="mid" 
												class="form-control form-round form-control-user" 
												maxlength="7" placeholder="Member ID">
										<button style="width: 20%" type="button" id="btn1" class="btn btn-secondary form-round mr-1"> 
											Duplication check 
										</button>
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
						<small style="margin-bottom:30px"><a href="/kico/login/form">Login</a></small>
					</div>
				</div>
			</div>
		
	</body>
</html>