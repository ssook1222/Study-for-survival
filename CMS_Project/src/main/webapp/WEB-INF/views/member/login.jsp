<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		
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
	
	<body class="bg-light">
		<script type="text/javascript">
			if("${messageFromServer}"=="fail"){
				alert("로그인에 실패하였습니다.")
			}
		</script>
		<div class="container">
			<div class="py-5 text-center">
				<h2>Login</h2>
			</div>
			
			<form id="login_form" action="${pageContext.request.contextPath}/login/check" method="POST">
				<div id="ramen" style="width:50%; margin:auto">
					<label for = "id" class="form-label">ID</label>
					<input class="form-control" type="text" id="mid" name="mid" placeholder="Member Id">
					<span id="idHelpInline" class="form-text">
	      				Must be 1-7 characters long.
	    			</span>
	    			
					<label style="margin-top:30px" for = "password" class="form-label">password</label>
					<input class="form-control" type="password" id="mpwd" name="mpwd" placeholder="Member Password">
					<span id="passwordHelpInline" class="form-text">
	      				Must be 1-7 characters long.
	    			</span>
	    			<div class="d-flex justify-content-center">
	    				<button style="float:left; margin-top:30px; margin-bottom:10px; width:50%" class="btn btn-secondary" type="submit">Log in</button>
	    			</div>
				</div>
			</form>
			<hr>
			<div class="text-center" style="margin-bottom:30px">
						<small>If you don't have account...</small>
						<br>
						<small><a href="/kico/signup/form">Sign-up</a><br></small>
						<small class="mt-5 mb-3 text-muted">&copy; 2017–2022</small>
			</div>
		</div>
	</body>
</html>