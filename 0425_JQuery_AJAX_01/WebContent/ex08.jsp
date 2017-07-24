<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			.redborder{border: 1px solid red;}
			.five{border-width: 5px;}
			.ten{border-width: 10px;}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				// filter('선택기(selector)') => 선택기에 매치되는 jQuery집합을 읽어 온다.
				// end() => 이전 상태로 되돌아감(ctrl + z)
				// .removeClass() => 클래스 삭제
				$("img")
				.addClass("redborder")
				.filter("[title *= 'jsp']").addClass("five")
				.end()			// 한 번 요소에 들어갔으면 그 이전 상태로 돌아가야 다시 다른 요소에 들어갈 수 있다.
				.filter("[title $= 'a']").addClass("five")
				.end()
				.filter("[title ^= 'spr']").removeClass()
				.end()
				.filter("[title $= 'a']").removeClass("ten")
				.end()
				.filter("[title *= 'jsp']").css("border","1px solid blue")
				.end()
				.filter("[title *= 'jsp']").removeClass()
				.end()
				.filter("[title $= 'a']").removeClass("five")
				.end();
			});
		</script>
	</head>
	<body>
		<img alt="JAVA" title="java" src="#"/>
		<img alt="JSP" title="jsp" src="#"/>
		<img alt="SPRING" title="spring" src="#"/>
	</body>
</html>