<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>동적 쿼리</title>
		<script type="text/javascript">
			function all_search(f) {
				f.action="/0424_MVC_paturn2/MyController?type=all";
				f.submit();
			}
			function dept_search(f) {
				f.action="/0424_MVC_paturn2/MyController?type=dept";
				f.submit();
			}
			function search_go(f) {
				f.action="/0424_MVC_paturn2/MyController?type=search";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form method="post">
			<input type="button" value="전체보기" onclick="all_search(this.form)"/>
			<input type="button" value="부서보기" onclick="dept_search(this.form)"/>
			<input type="button" value="동적검색" onclick="search_go(this.form)"/>
		</form>
	</body>
</html>