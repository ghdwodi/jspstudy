<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 페이지</title>
		<style type="text/css">
			table, tr, td{border: 1px solid black}
			div{text-align: center;}
		</style>
		<script type="text/javascript">
			function login_go(f) {
				/* 유효성 검사는 무조건 클라이언트에서 해야 한다. */
				if(f.id.value==""){
					alert("아이디를 입력하세요.");
					f.id.focus();
					return;
				}
				if(f.pwd.value==""){
					alert("아이디를 입력하세요.");
					f.pwd.focus();
					return;
				}
				f.action="login.jsp";
				f.submit();
			}
			function add_go(f) {
				f.action="add.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<div>
			<form method="post">
				<table>
					<tbody>
						<tr>
							<td colspan="2" >
								<h2>로그인 페이지</h2>
							</td>
						</tr>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" /></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="pwd" /></td>
						</tr>
						<tr>
							<td colspan="2" >
								<input type="button" value="로그인" onclick="login_go(this.form)" />
								<input type="button" value="회원가입" onclick="add_go(this.form)" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</body>
</html>