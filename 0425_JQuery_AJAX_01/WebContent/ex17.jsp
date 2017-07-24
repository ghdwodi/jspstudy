<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>keyup/down/press</title>
		<style type="text/css"></style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("input").keyup(function() {
					$(this).css("background","yellow");
				});
				$("input").keydown(function() {
					$(this).css("background","red");
				});
				$("#pwd").keyup(function() {
					$("#mydiv").text("");
				});
				$("#pwd2").keyup(function() {
					if($("#pwd").val() == $("#pwd2").val()){
						$("#mydiv").text("암호가 맞네요");
					}else{
						$("#mydiv").text("암호가 틀리네요");
					}			
				});
			});
		</script>
	</head>
	<body>
		Enter your name : <input type="text" />
		<p>키보드 이벤트 : 눌렀을때와 띄었을때 가 다른 색 지정</p>
		<hr />
		<p> 비밀번호 : <input type="password" id="pwd" name="pwd" /></p>
		<p> 비밀번호 확인 : 
		    <input type="password" id="pwd2" name="pwd2" /></p>
		<div id="mydiv">암호를 입력하세요</div>    
	</body>
</html>