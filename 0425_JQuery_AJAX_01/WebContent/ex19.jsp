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
				$("#calculator").change(function() {
					var su1 = parseInt($("#su1").val())
					var su2 = parseInt($("#su2").val())
					var calc = $("option:selected").val();
					if(calc=="+"){
						$("#result").val(su1+su2);
					}else if(calc=="-"){
						$("#result").val(su1-su2);
					}else if(calc=="×"){
						$("#result").val(su1*su2);
					}else if(calc=="÷"){
						if(su2==0){
							$("#result").val("0으로는 나눌 수 없어요");
						}else{
							$("#result").val(su1/su2);
						}
					}else{
						$("#result").val("연산자를 선택하세요");
					}
				});
			});
		</script>
	</head>
	<body>
		<input type="number" id="su1"/>
		<select id="calculator">
			<option>연산자 선택</option>
			<option>+</option>
			<option>-</option>
			<option>×</option>
			<option>÷</option>
		</select>
		<input type="number" id="su2"/>
		=
		<input type="text" id="result"/>
	</body>
</html>