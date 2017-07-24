<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>clone,insertBefore,insertAfter,appendTo,perpendTo</title>
		<style type="text/css">
			#menu{background-color: blue; color: white;}
			#content{height: 200px;}
			#submenu{background-color: silver;}
			div{border: 1px solid red;}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				// insertBefore < prependTo < 기준 > appendTo > insertAfter
				$("#menu").clone().insertAfter("#submenu")
				.css("background-color","skyblue")
				.css("color","black");
				$("#menu").clone().prependTo("#submenu")
				.css("background-color","green")
				.css("color","black");
				$("#menu").clone().appendTo("#submenu")
				.css("background-color","pink")
				.css("color","black");
				$("#menu").clone().insertBefore("#submenu")
				.css("background-color","orange")
				.css("color","black");
//				$("#content").append($("#menu"));
				$("#content").html($("#menu"));
			});
		</script>
	</head>
	<body>
		<div id="menu">Home About</div>
		<div id="content">상단 메뉴를 아래 하단 메뉴에 복사</div>
		<div id="submenu">하단 메뉴</div>
	</body>
</html>