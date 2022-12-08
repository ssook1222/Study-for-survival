<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>08.Include.jsp</title>
	</head>
	<body>
	
	
	<script type="text/javascript">
	function callServer() {
		//form1.action = "./08include2.jsp";
		//form1.action = "./09jsp_action_include2.jsp";
		form1.action = "./10jsp_action_forward2.jsp";
		form1.submit();
	}
	</script>
	<form id="form1">
		<input type="text" id="txt1" name="txt1" value="This is data from client.">
		<button type="button" onclick="callServer();">data send</button>
	</form>

	
	
	</body>
</html>