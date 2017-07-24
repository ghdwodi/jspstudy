<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>slideUp, slideDown</title>
		<style type="text/css">
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("p:eq(1)").css("background","yellow")
				.click(function() {
					var t = $(this);
					t.next().slideDown("slow", function() {
						t.slideUp("slow");
					});
				});
				$("p:eq(0)").click(function() {
					$("img").slideToggle("slow");
				});
			});
		</script>
	</head>
	<body>
		<p>첫번째</p>
		<p>두번째</p>
		<p style="display: none;">세번째</p>
		<p>네번째</p>
		<img alt="java" src="JQuery_img/image1.gif"/>
	</body>
</html>