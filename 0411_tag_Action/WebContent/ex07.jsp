<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>액션태그</title>
		<script type="text/javascript">
			function go(f) {
				f.action="ex08.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			이름 : <input type="text" name="name" /> <br />
			나이 : <input type="number" name="age" /> <br />
			<input type="button" value="보내기" onclick="go(this.form)"/>
		</form>
	</body>
</html>