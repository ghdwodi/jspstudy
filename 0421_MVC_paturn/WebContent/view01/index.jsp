<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function test1() {
				location.href="/0421_MVC_paturn/MyCon01?cmd=hi";
			}
			function test2() {
				location.href="/0421_MVC_paturn/MyCon01?cmd=hello";
			}
		</script>
	</head>
	<body>
		<button onclick="test1()">test1</button>
		<button onclick="test2()">test2</button>
	</body>
</html>