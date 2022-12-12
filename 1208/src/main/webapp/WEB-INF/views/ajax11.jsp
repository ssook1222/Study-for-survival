<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax11</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#btn1").click(function() {
			$.get(
					"${pageContext.request.contextPath}/ajax11return"
					, {
						data1 : $("#txt1").val()
						, data2 : $("#txt2").val()
					}
					, function(data, status) {//data:서버가 보내는 결과값, status:통신 성공 여부.
						$("#txtDiv").text(data);
					}
			);//1.서버주소, 2.서버로 보낼 데이터, 3. call back method(서버가 돌려주는 결과값), 4.json 모드 on
		});//click
	});//ready
	</script>

	<h1>프로젝트 url : ${pageContext.request.contextPath} : sever.xml의 Context Path</h1>
	<div id="txtDiv">Ajax를 사용하여, 이 곳의 텍스트를 바꾸는 예제</div>
	<button type="button" id="btn1"> Call Ajax </button>
	<input type="text" id="txt1" value="신입사원">
	<input type="text" id="txt2" value="education">

</body>
</html>




