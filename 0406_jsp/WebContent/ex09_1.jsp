<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			div{
				border : 1px solid black;
				text-align: center;
				padding: 15px;
				width: 20%
			}
		</style>
		<script type="text/javascript">
			function log_in(f) {
				if (f.name.value=="") {
					alert("이름을 입력하세요");
					f.name.focus();
					return;
				}
				f.action = "ex09_2.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<div>
			<h2>로그인</h2>
			<form>
				<input type="text" name="name" />
				<input type="button" value="login" onclick="log_in(this.form)" />
			</form>
		</div>
	</body>
</html>