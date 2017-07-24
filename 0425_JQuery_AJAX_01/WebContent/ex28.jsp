<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			#content{
				width: 1200px;
				height: 600px;
				background-color: skyblue;
				padding-left: 20px;
				padding-right: 20px;
			}
			img{width: 200px; height: 250px}
			#movie{
				width: 200px;
				height: 300px;
				border:  1px dashed red;
				position: absolute;
				top: 200px;
				left:50px;
				padding: 20px;
				display: none;
			}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$("#show").click(function() {
				$("#movie").show();
			});
			$("#close").click(function() {
				$("#movie").hide();
			});
		</script>
	</head>
	<body>
		<div id="movie">
			<img id="close" src="JQuery_img/image1.gif"/>
		</div>
		<div id="content">
			<h2>피카다리 영화관</h2>
			<p>망했냐?<br />몰라몰라몰라</p>
			<button id="show">영화보기</button>
		</div>
	</body>
</html>