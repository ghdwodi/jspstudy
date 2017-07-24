<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			#box{
				background-color: yellow;
				height: 50px;
				width: 250px;
				border: 1px solid red;
			}
			#bar{
				background-color: red;
				height: 50px;
				width: 1px;
			}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn").click(function() {
					$("#bar").animate(
						{width:"250px"},
						{duration:5000, easing:"linear",
							step:function(x){
								$("#demo").text(Math.round(x*100/250)+"%")
							}
						}
					);
				});
			});
		</script>
	</head>
	<body>
		<div id="box">
			<div id="bar">
			</div>
		</div>
		<button id="btn">Start Progress Bar</button>
		<p id="demo"></p>
	</body>
</html>