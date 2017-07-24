<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=divice-width">
		<title>반응형 웹 : 화면비율</title>
		<style type="text/css">
			body{background-color: gray;}
			#logo img{
				width : 80%;
				margin-top: 50px;
			}
			@media screen and (min-aspect-ratio : 16/9){
				body{background-color: yellow;}
			}
			@media screen and (max-aspect-ratio : 16/9){
				body{background-color: green;}
			}
		</style>
	</head>
	<body>
	<%--
		- 화면 비율 -
		aspect-ratio : 화면비율(너비/높이)
	--%>
		<div id="logo">
			<img alt="홍길동" src="img/image.jpg">
		</div>
	</body>
</html>