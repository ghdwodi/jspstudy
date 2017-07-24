<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<script type="text/javascript">
			function loginok_go(f) {
				if(f.id.value==""){
					alert("ID를 입력하세요.");
					f.id.focus();
					return;
				}
				if(f.pwd.value==""){
					alert("비밀번호를 입력하세요.");
					f.pwd.focus();
					return;
				}
				f.action="login_ok.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form method="post">
			<fieldset>
				<legend>로그인</legend>
				<h2>ID :</h2><input type="text" name="id"><br>
				<h2>비밀번호 :</h2><input type="text" name="pwd"><br>
				<input type="button" value="가입하기" onclick="javascript:location.href='join.jsp'">
				<input type="button" value="로그인" onclick="loginok_go(this.form)">
			</fieldset>
		</form>
	</body>
</html>