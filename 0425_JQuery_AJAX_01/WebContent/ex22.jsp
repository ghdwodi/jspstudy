<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				var timer;
				var position=0;
				$("input:button").click(function() {
					timer = setInterval(moveImage, 200);
				});
				function moveImage() {
					position +=5;
					$("img").css("marginLeft",position);
				}
				$("img").click(function() {
					clearInterval(timer);
				});
			});
		</script>
	</head>
	<body>
		<input type="button" value="이동"/>
		<p>.</p><p>.</p><p>.</p><p>.</p><p>.</p><p>.</p>
		<img alt="java" src="JQuery_img/image1.gif">
	</body>
</html>