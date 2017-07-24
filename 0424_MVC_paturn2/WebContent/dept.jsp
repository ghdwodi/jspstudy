<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>부서검색</title>
		<script type="text/javascript">
			function dept_search(f) {
				f.action="/0424_MVC_paturn2/MyController?type=dept_ok";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form method="post">
			부서코드 : <input type="text" name="deptno"/>
			<input type="button" value="부서검색" onclick="dept_search(this.form)"/>
		</form>
	</body>
</html>