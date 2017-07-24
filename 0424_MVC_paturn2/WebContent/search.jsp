<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>동적 검색</title>
		<script type="text/javascript">
			function search_go(f) {
				f.action="/0424_MVC_paturn2/MyController?type=search";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form method="post">
			<select name="idx">
				<option value="0">사번</option>
				<option value="1">이름</option>
				<option value="2">직종</option>
				<option value="3">부서</option>
			</select>
			<input type="text" name="keyword"/>
			<input type="button" value="동적검색" onclick="search_go(this.form)"/>
		</form>
	</body>
</html>