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
				$(".button").click(function() {
					var res = $(".res");
					var fs = res.css("fontSize");	// res클래스의 글자크기 (기본값은 16px)
					var su = parseInt(fs);	// 16
					var dan = fs.slice(-2);	// px
					if(this.id == "goBig"){
						su = su * 1.5;
					}else if(this.id == "goSmall"){
						su = su / 1.5;
					}
					res.css("fontSize", su+dan);
				})
			});
		</script>
	</head>
	<body>
		<div id="btn">
			<div class="button" id="goBig">늘리기</div>
			<div class="button" id="goSmall">줄이기</div>
		</div>
		<div class="res">안녕하슈</div>
	</body>
</html>