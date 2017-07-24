<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send_go() {
				if(joinform.id.value==""){
					alert("ID를 입력하세요.");
					joinform.id.focus();
					return;
				}
				if(joinform.pwd.value==""){
					alert("비밀번호를 입력하세요.");
					joinform.pwd.focus();
					return;
				}
				if(joinform.pwd2.value!=joinform.pwd.value){
					alert("비밀번호가 다릅니다.");
					joinform.pwd2.focus();
					return;
				}
				if(joinform.name.value==""){
					alert("이름을 입력하세요.");
					joinform.name.focus();
					return;
				}
				if(joinform.age.value==""){
					alert("나이를 입력하세요.");
					joinform.age.focus();
					return;
				}
				if(joinform.gender.value==""){
					alert("성별을 입력하세요.");
					joinform.gender.focus();
					return;
				}
				joinform.action="Shop_Controller?cmd=join&chk=ok";
				joinform.submit();
			}
		</script>
	</head>
	<body>
		<form name="joinform" method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<th colspan="2"><h1>회원가입 페이지</h1></th>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id"/></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"/></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" name="pwd2"/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="number" name="age"/></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							남성<input type="radio" value="남성" name="gender"/>
							여성<input type="radio" value="여성" name="gender"/>
						</td>
					</tr>
					<tr>
						<td>사진</td>
						<td>
							<input type="file" name="photo"/>
							<input type="hidden" name="path"/>
						</td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email"/></td>
					</tr>
					<tr>
						<td><input type="button" value="회원가입" onclick="send_go()"></td>
						<td><input type="reset" name="초기화"/></td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>