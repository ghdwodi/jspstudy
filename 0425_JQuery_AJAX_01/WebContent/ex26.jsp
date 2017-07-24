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
				var vertical = 0;
				var horizontal = 0;
				$("#go").click(function() {
					$("img").animate({marginLeft:"+=100", marginTop:"+=100"},500);
				});
				$("#stop").click(function() {
					$("img").stop();
				})
				$("#back").click(function() {
					$("img").animate({left:"-=100", top:"-=100"},500);
				})
			});
		</script>
	</head>
	<body>
		<button id="go">go</button>
		<button id="stop">stop</button>
		<button id="back">back</button>
		<img alt="java" src="JQuery_img/image1.gif">
	</body>
</html>