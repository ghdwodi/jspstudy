<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=divice-width">
		<title>반응형 웹 : 회전방향</title>
		<style type="text/css">
			body{background-color: gray;}
			#logo img{
				width : 80%;
				margin-top: 50px;
			}
			@media screen and (orientation:landscape){
				body{background-color: yellow;}
			}
			@media screen and (orientation:portrait){
				body{background-color: green;}
			}
		</style>
	</head>
	<body>
	<%--
		- 화면 회전 -
		orientation : portrait <= 세로방향(초상화)
		orientation : landscape <= 가로방향(풍경화)
	--%>
		<div id="logo">
			<img alt="홍길동" src="img/image.jpg">
		</div>
	</body>
</html>