<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param</title>
</head>
<body>

	<form method="get" action="./02paramget.jsp">
		text : <input type="text" id="name" name="name">
		<hr>
		hidden text : <input type="hidden" id="hid_txt" name="hid_txt" value = "this is hidden data.">
		<!-- value를 우리가 마음대로 지정함 -->
		<!-- 서버로 보내는 데이터는 반드시 이름을 지정해야 함. -->
		<hr>
		password : <input type="password" id="pwd" name="pwd">
		<hr>
		<!-- 같은 이름으로 선언되어야 하나의 그룹으로 움직임 -->
		gender : <input type="radio" id="rdo1" name="gender" value="female"> 여자
		<input type="radio" id="rdo2" name="gender" value="male"> 남자
		<hr>
		<select id="sel1" name="sel1">
			<option value="apple">apple</option>
			<option value="banana">banana</option>
			<option value="chery">cherry</option>
		</select>
		<hr>
		<select id="sports" name="sports" multiple="multiple">
			<option value="soccer">soccer</option>
			<option value="baseball">baseball</option>
			<option value="volleyball">volleyball</option>
		</select>
		<hr>
		<hr>
		<hr>
		<input type="submit" value="데이터 전송">
	</form>

</body>
</html>