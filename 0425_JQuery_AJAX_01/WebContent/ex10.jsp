<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>toggle, toggleClass</title>
		<style type="text/css">
			.hidden{display: none}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
//				$("#btn").click(function() {
//					$("#mydiv").toggle("hidden");
//				});
				$("#btn").on("click",function() {
					$("#mydiv").toggle("hidden");
				});
				
			});
		</script>
	</head>
	<body>
		<h2>버튼을 클릭할때마다 div 보이기/숨기기</h2>
		<button id="btn">버튼</button>
		<div id="mydiv">
			<img alt="java" src="JQuery_img/image1.gif"/>
		</div>
	</body>
</html>