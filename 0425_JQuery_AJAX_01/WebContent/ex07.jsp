<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메소드를 동적으로 이벤트 부여 = bind</title>
		<style type="text/css"></style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
//				$("#btn").click(function() {alert('Hi~~');});
//				$("#btn").bind("click",function() {alert('Hello~~');});
//				$("#btn").click(function() {$("#img").hide();});
//				$("#btn").bind("click",function() {$("#img").hide();});

				// bind는 JQuery3 이후 사장되었으므로 on으로 대체
//				$("#btn").on("mouseover",function() {$("#img").hide();});
//				$("#btn").on("mouseout",function() {$("#img").show();});
				$("#btn").mouseover(function() {$("#img").hide();});
				$("#btn").mouseout(function() {$("#img").show();});
			});
		</script>
	</head>
	<body>
		<div id="btn">안녕</div>
		<img id="img" src="JQuery_img/image1.gif"/>
	</body>
</html>