<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send_go(f) {
				f.action="/0421_MVC_paturn/MyCon05";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<p>이름 : <input type="text" name="name" /></p>
			<p>국어 : <input type="number" name="kor" /></p>
			<p>영어 : <input type="number" name="eng" /></p>
			<p>수학 : <input type="number" name="math" /></p>
			<input type="button" value="성적확인" onclick="send_go(this.form)">
		</form>
	</body>
</html>