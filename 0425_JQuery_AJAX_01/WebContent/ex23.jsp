<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			#box{width: 70px; height: 70px; background-color: pink;}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn1").click(function() {
					$("#box").hide(400);
				});
				$("#btn2").click(function() {
					$("#box").show("slow");
				});
				$("#btn3").click(function() {
					$("#box").toggle(400);
				});
				$("#btn4").click(function() {
					$("#box").slideUp(400);
				});
				$("#btn5").click(function() {
					$("#box").slideDown(400);
				});
				$("#btn6").click(function() {
					$("#box").slideToggle(400);
				});
			});
		</script>
	</head>
	<body>
		<input type="button" value="숨기기" id="btn1"/>
		<input type="button" value="보이기" id="btn2"/>
		<input type="button" value="토글1" id="btn3"/>
		<input type="button" value="위로 숨기기" id="btn4"/>
		<input type="button" value="아래로 보이기" id="btn5"/>
		<input type="button" value="토글2" id="btn6"/>
		<p>.</p><p>.</p><p>.</p><p>.</p><p>.</p><p>.</p>
		<div id="box"><img alt="java" src="JQuery_img/image1.gif"></div>
	</body>
</html>