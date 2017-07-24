<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css"></style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#myselect").change(function() {
					var res = $("option:selected").val();
					$("#str").val(res);
				});
				$(".gender").change(function() {
					var res = $("input:checked").val()
					$("#str2").val(res);
				});
				$(".chk").change(function() {
					var res = "";
					$("input[type=checkbox]:checked").each(function() {
						res += $(this).val()+","
					});
					$("#str3").val(res);
				});
			});
		</script>
	</head>
	<body>
		<select id="myselect">
			<option>java</option>
			<option>jsp</option>
			<option>spring</option>
		</select>
		<input type="text" id="str" name="str"/>
		<hr />
		<input type="radio" name="gender" id="gender1" class="gender" value="남"/>남
		<input type="radio" name="gender" id="gender2" class="gender" value="여"/>여
		<input type="text" id="str2" name="str2"/>
		<hr />
		<input type="checkbox" name="hobby" class="chk" value="축구"/>축구
		<input type="checkbox" name="hobby" class="chk" value="야구"/>야구
		<input type="checkbox" name="hobby" class="chk" value="배구"/>배구
		<input type="checkbox" name="hobby" class="chk" value="농구"/>농구
		<input type="text" id="str3" name="str3"/>
		<hr />
	</body>
</html>