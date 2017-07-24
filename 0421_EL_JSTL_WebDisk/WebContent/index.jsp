<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 페이지</title>
		<style type="text/css">
			fieldset{width: 300px;}
			#reg{display: none;}
		</style>
		<script type="text/javascript">
			function regView() {
				document.getElementById("login").style.display="none";
				document.getElementById("reg").style.display="block";
			}
			function return_go() {
				document.getElementById("login").style.display="block";
				document.getElementById("reg").style.display="none";
			}
			function regLogin(f) {
				if(f.id.value==""){
					alert("ID를 입력하십시오.");
					f.id.focus();
					return;
				}
				if(f.pwd.value==""){
					alert("비밀번호를 입력하십시오.");
					f.pwd.focus();
					return;
				}
				f.action="login.jsp";
				f.submit();
			}
			function add_go(f){
				if(f.id.value==""){
					alert("ID를 입력하십시오.");
					f.id.focus();
					return;
				}
				if(f.pwd.value==""){
					alert("비밀번호를 입력하십시오.");
					f.pwd.focus();
					return;
				}
				if(f.name.value==""){
					alert("이름을 입력하십시오.");
					f.name.focus();
					return;
				}
				f.action="add.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<div id="login">
			<form method="post">
				<fieldset>
					<legend>로그인</legend>
					<p>아이디 : <input type="text" name="id" /></p>
					<p>비밀번호 : <input type="password" name="pwd" /></p>
					<input type="button" value="회원가입" onclick="regView()" />
					<input type="button" value="로그인" onclick="regLogin(this.form)" />
				</fieldset>
			</form>
		</div>
		<div id="reg">
			<form method="post">
				<fieldset>
					<legend>회원가입</legend>
					<table>
						<tbody>
							<tr><td>아이디</td><td><input type="text" name="id" /></td></tr>
							<tr><td>패스워드</td><td><input type="password" name="pwd" /></td></tr>
							<tr><td>이름</td><td><input type="text" name="name" /></td></tr>
							<tr><td>나이</td><td><input type="number" name="age" /></td></tr>
							<tr><td>주소</td><td><input type="text" name="addr" /></td></tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<input type="button" value="가입" onclick="add_go(this.form)" />
									<input type="button" value="로그인" onclick="return_go()" />
									<input type="reset" value="초기화" />
								</td>
							</tr>
						</tfoot>
					</table>
				</fieldset>
			</form>
		</div>
	</body>
</html>