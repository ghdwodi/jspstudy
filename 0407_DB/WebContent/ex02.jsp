<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DB연동</title>
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
			function select_one(f) {
				if(f.id.value==""){
					alert("id를 입력하세요.");
					return;
				}
				f.action="ex03.jsp";
				f.submit();
			}
			function insert_go(f) {
				if(f.id.value==""){
					alert("id를 입력하세요.");
					return;
				}
				if(f.pw.value==""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				if(f.name.value==""){
					alert("이름을 입력하세요.");
					return;
				}
				if(f.age.value==""){
					alert("주소를 입력하세요.");
					return;
				}
				if(f.addr.value==""){
					alert("주소를 입력하세요.");
					return;
				}
				f.action="ex04.jsp";
				f.submit();
			}
			function delete_go(f) {
				if(f.id.value==""){
					alert("id를 입력하세요.");
					return;
				}
				if(f.pw.value==""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				f.action="ex05.jsp";
				f.submit();
			}
			function getdata_go(f) {
				if(f.id.value==""){
					alert("id를 입력하세요.");
					return;
				}
				if(f.pw.value==""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				f.action="ex06.jsp";
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
							<td>패스워드</td><td><input type="text" name="pw" /></td>
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
								<!-- <input type="button" value="전체검색" onclick="" /> -->
								<input type="button" value="검색" onclick="select_one(this.form)" />
								<input type="button" value="삽입" onclick="insert_go(this.form)" />
								<input type="button" value="삭제" onclick="delete_go(this.form)" />
								<input type="button" value="불러오기" onclick="getdata_go(this.form)" />
								<input type="reset" value="취소" />
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		<hr />
		<div id="ex01">
			<%-- 지시어 include : 해당 페이지의 소스를 "붙여넣기"한 효과임에 주의 --%>
			<%-- 다른 페이지의 소스를 가져와서 현재 페이지에서 해석 --%>
			<%-- action include란 것도 있다. --%>
			<%@ include file="ex01.jsp" %>
		</div>
	</body>
</html>