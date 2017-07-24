<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 요소</title>
<style type="text/css"></style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
	     $("[type=text]").css("background","silver");
	     $("#btn").click(function() {
			var v = $("#id").val();
			$("#id2").val(v);
		});
	     // 라디오버튼, 체크박스, select는 click을 사용하지 않는다.
	     $("#chk").change(function() {
	    	 if($(this).is(":checked")){
				var v = $("#id").val();
				$("#id2").val(v);
	    	 }
		});
	});
</script>
</head>
<body>
	아이디 : <input type="text" name="id" id="id" />
	<hr />
	<input type="button" value ="상동" id="btn" />
	<input type="checkbox" id="chk" value="1"/>상동
	<hr />
	아이디 : <input type="text" name="id2" id="id2" />
</body>
</html>