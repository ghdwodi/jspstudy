<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 페이지</title>
		<style type="text/css">
			div{
				align: left;
				text-align: center;
			}
			table,th,td {
				border: 1px solid black;
				align: center;
			}
			#ex01{
				align: center;
				width: 600px;
			}
		</style>
		<script type="text/javascript">
			function add_go(f) {
				if(f.id.value==""){
					alert("아이디를 입력하세요.");
					f.id.focus();
					return;
				}
				if(f.pwd.value==""){
					alert("비밀번호를 입력하세요.");
					f.pwd.focus();
					return;
				}
				if(f.name.value==""){
					alert("이름을 입력하세요.");
					f.name.focus();
					return;
				}
				if(f.age.value==""){
					alert("나이를 입력하세요.");
					f.age.focus();
					return;
				}
				if(f.addr.value==""){
					alert("아이디를 입력하세요.");
					f.addr.focus();
					return;
				}
				f.action="add_ok.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<hr />
			<div>
				<form>
					<table>
						<thead>
							<tr >
								<th colspan="2">회원 정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>아이디</td><td><input type="text" name="id" /></td>
							</tr>
							<tr>
								<td>패스워드</td><td><input type="text" name="pwd" /></td>
							</tr>
							<tr>
								<td>이름</td><td><input type="text" name="name" /></td>
							</tr>
							<tr>
								<td>나이</td><td><input type="number" name="age" /></td>
							</tr>
							<tr>
								<td>주소</td><td><input type="text" name="addr" /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2">
									<input type="button" value="회원가입" onclick="add_go(this.form)" />
									<input type="reset" value="취소" />
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		<hr />
	</body>
</html>