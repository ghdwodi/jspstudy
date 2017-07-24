<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=divice-width, initial-scale=1.0">
		<title>반응형 웹 : border-box</title>
		<style type="text/css">
			/* 패딩과 보더가 요소의 전체 너비와 높이에 포함된다. */
			*{box-sizing: border-box;}
			.header{
				border: 1px solid red;
    			padding: 15px;
			}
			.menu{
				width: 25%;
				float: left;
				border: 1px solid red;
				padding: 15px;
			}
			.main{
				width: 75%;
				float: left;
				border: 1px solid red;
				padding: 15px;
			}
		</style>
	</head>
	<body>
		<div class="header">
			<h1>Chania</h1>
		</div>
		<div class="menu">
			<ul>
				<li>The Flight</li>
				<li>The City</li>
				<li>The Island</li>
				<li>The Food</li>
			</ul>
		</div>
		<div class="main">
			<h1>The City</h1>
			<p>Chania is the capital of the Chania region on the island of Crete. The city can be divided in two parts, the old town and the modern city.</p>
			<p>Resize the browser window to see how the content respond to the resizing.</p>
		</div>
	</body>
</html>