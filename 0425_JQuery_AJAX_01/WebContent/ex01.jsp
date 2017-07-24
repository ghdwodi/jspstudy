<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JQuery</title>
		<style type="text/css">
			<%-- 아이디(#), 클래스(.), 요소(태그) --%>
			#change1{
				background-color: red;
			}
			.silver{
				background-color: silver;
			}
			.highlight{
				color: navy;
			}
		</style>
		<script type="text/javascript">
			function go() {
				alert("Hello~");
			}
		</script>
		<script type="text/javascript">
			onload = function() {
				document.getElementById("change2").style.backgroundColor="blue";
				document.getElementById("change2").onclick=function(){
					alert("Nice to meet you.");
				}
			}
		</script>
		<%-- 라이브러리 등록 --%>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<%-- j쿼리 실행 --%>
		<script type="text/javascript">
			<%-- 페이지 로드 이벤트 : body 내용을 모두 읽고 난 후 실행 --%>
			<%-- body onload="자바스크립트 함수()" 와 같은 효과 --%>
         /* $(document).ready(function() {});
			$().ready(function() {});
			$(function() {}); */
			$(function() {
				// $(선택자).click(function(){처리 내용});
				$("#change3").click(function() {
					<%-- $(선택자).addClass("클래스이름"); 스타일 적용--%>
			    	$("#change3").addClass("silver highlight");
			    	alert('하이하이');
				})
			});
		</script>
	</head>
	<body>
		<div style="background-color: yellow;" onclick="alert('Hi')">
			안녕하십니까. jQuery Study1입니다.
		</div>
		<div id="change1" onclick="go()">
			안녕하십니까. jQuery Study1입니다.
		</div>
		<div id="change2">
			안녕하십니까. jQuery Study1입니다.
		</div>
		<div id="change3">
			안녕하십니까. jQuery Study1입니다.
		</div>
	</body>
</html>