<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>script소스파일을 jQuery로 읽어오기</title>
		<style type="text/css">
			table{
				border: 1px solid red;
				width: 600px;
			}
			tr,th,td{border: 1px solid red;}
		</style>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn").click(function() {
					$.getScript("script.js");
				});
			});
		</script>
	</head>
	<body>
		<div id="btn">xml jQuery로 읽기</div>
		<hr />
		<div id="out"></div>
	</body>
</html>