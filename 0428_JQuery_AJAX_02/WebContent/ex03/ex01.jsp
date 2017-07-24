<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jQuery.load</title>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#btn").click(function() {
					//jQuery.load(url,data,callback)
					$("#out1").load("data.jsp");
				});
			});
		</script>
	</head>
	<body>
		<div id="btn">
			<div class="btnload"><h2>원래 제목</h2></div>
		</div>
		<div>
			<p id="out1">원래 내용</p>
		</div>
		<div>
			<p id="out2">원래 내용</p>
			<jsp:include page="data.jsp"/>
		</div>
		<div>
			<p id="out3">원래 내용</p>
			<%@include file="data.jsp"%>
		</div>
	</body>
</html>