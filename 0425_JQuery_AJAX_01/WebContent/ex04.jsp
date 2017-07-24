<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선택자를 이용한 addClass2</title>
		<style type="text/css">
			.c_red{color: red;}
			.c_orange{color: orange;}
			.c_silver{color: silver;}
			.c_purple{color: purple;}
			.c_navy{color: navy;}
			.b_red{background-color: red;}
			.b_orange{background-color: orange;}
			.b_green{background-color: green;}
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			// j쿼리 선택자들
			$(function() {
				// 자식 선택자를 이용
				$("ul>li").addClass("c_red");
				// :first	첫번째 요소
				$("div:first").addClass("c_red");
				// :last	마지막 요소
				$("div:last").addClass("c_navy");
				// :even	짝수번째 요소 (0부터 시작함에 주의)
				$("div:even").addClass("b_orange");
				// :odd		홀수번째 요소
				$("div:odd").addClass("b_green");
				
				// 부모요소>자식요소
				// 클래스 즉석에서 만들어 사용하기
				// .addClass("클래스이름")==$(선택지).css("속성","값")
				$("body>ul>ul>ul>li:first").css("background-color","skyblue");
				$("body>ul> li").css("color","green");
				$("body>ul>li:last").css("color","blue");
			});
		</script>
	</head>
	<body>
		<div class="red">
			<h3>Red영역</h3>
			<h3>Red2영역</h3>
		</div>
		<div>Green영역
			<h3>Green2영역</h3>
		</div>
		<div>Blue영역</div>
		<span id="t">텍스트영역</span>
		<ul type="disc">
			<li>java</li>
			<li>jsp</li>
			<ul>
				<li>servlet</li>
				<ul type="circle">
					<li>EL</li>
					<li>JSTL</li>
				</ul>
				<li>spring</li>
			</ul>
			<li>Android</li>
		</ul>
	</body>
</html>