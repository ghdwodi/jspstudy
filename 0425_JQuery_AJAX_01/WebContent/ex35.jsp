<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.myDiv{position: absolute;}
</style>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#go").click(function(){
			$(".myDiv").animate({left: "+=100",top:"+=100"},400);
		})
		$("#stop").click(function(){
			$(".myDiv").stop();
		})
		$("#back").click(function(){
			$(".myDiv").animate({left: "-=100",top:"-=100"},400);
		})
	})
</script>
</head>
<body>
	<button id="go">go</button>
	<button id="stop">stop</button>
	<button id="back">back</button>
	<div class="myDiv"><img alt="java" src="img/image1.gif" /></div>
</body>
</html>