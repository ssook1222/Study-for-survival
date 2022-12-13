<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>day1el1</title>
	</head>
	<body>
		<h1>EL : Expression Language : $와 중괄호를 사용하여 출력을 표현</h1>
		<h1>${ 1 + 1 } : EL : jsp 출력 태그(&lt;%=출력%&gt;)의 다른 모습</h1>
		<h1>+ : ${ "10" + 1 } : ${ null + 1 } : ${ "10" + "10" }</h1>
		<h1>+ - * / % : ${ 123 + 4 } : ${ 123 - 4 } : ${ 123 * 4 } : ${ 123 / 4 } : ${ 123 % 4 }</h1>
		<h1>div mpd : ${ 123 div 4 } : ${ 123 mod 4 }</h1>
		<h1>eq ne : ${ 123 == 4 } : ${ 123 eq 4 } : ${ 123 != 4 } : ${ 123 ne 4 }</h1>
		<h1>gt lt : ${ 123 > 4 } : ${ 123 gt 4 } : ${ 123 < 4 } : ${ 123 lt 4 }</h1>
		<h1>ge le : ${ 123 >= 4 } : ${ 123 ge 4 } : ${ 123 <= 4 } : ${ 123 le 4 }</h1>
		<h1>and : ${ true and true } : ${ true and false } : ${ false and true } : ${ false and false }</h1>
		<h1>or : ${ true or true } : ${ true or false } : ${ false or true } : ${ false or false }</h1>
		<h1>not : ${ !true } : ${ not true }</h1>
		<h1>3항 연산자 (1 > 3)? : ${ (1 > 3)? "참" : "거짓" }</h1>
	</body>
</html>










