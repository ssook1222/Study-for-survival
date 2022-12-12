<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax12</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {
			$.get(
					"${pageContext.request.contextPath}/ajax12return"
					, {
						mid : $("#mid").val()
					}
					, function(data, status) {
						if(data > 0) {
							$("label[for=mid]").text("이미 사용중인 아이디 입니다.");
							$("label[for=mid]").css("color", "red");
						} else {
							$("label[for=mid]").text("사용하실 수 있는 아이디 입니다.");
							$("label[for=mid]").css("color", "blue");
						}
					}//function
			);
		});//click
	});//ready
	</script>
	<div class="container">
		<form class="form-inline mt-5">
			아이디 <input type="text" id="mid" class="form-control mr-1">
			<button type="button" id="btn1" class="btn btn-primary mr-1"> ID 중복 체크 </button>
			<label for="mid">이름표</label>
		</form>
	</div>
</body>
</html>
