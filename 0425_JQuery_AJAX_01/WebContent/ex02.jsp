<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선택자를 이용한 addClass</title>
		<style type="text/css">
			.bg{background-color: yellow;}
			.cg{color: red;}
			.horizontal{
				float: left;
				list-style: none;
				margin: 10px;
			}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				// 요소 선택자 : 해당 태그 선택
				$("li").addClass("bg");
				// 클래스 선택자 : .
				$(".s").addClass("cg");
				// 아이디 선택자 : #
				$("#j").addClass("cg");
				// 자식 선택자 : >
				$("ul>li").addClass("horizontal");
				// 자손 선택자 : 공백
				$("ol li").addClass("horizontal")
			});
		</script>
	</head>
	<body>
		<h2>
			<ul id="my">
				<li><u>java</u></li>
				<li>html</li>
				<li class="s">servlet&<u>jsp</u></li>
				<li id="j">spring</li>
			</ul>
			<hr />
			<ol id="my2">
				<li><u>java</u></li>
				<li>html</li>
				<li class="s">servlet&<u>jsp</u></li>
				<li id="j2">spring</li>
			</ol>
		</h2>
	</body>
</html>