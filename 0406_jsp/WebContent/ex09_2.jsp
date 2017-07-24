<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	// 요청자료를 utf-8로 처리(필수)
	String name = request.getParameter("name");
	session.setAttribute("name", name);
%>
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
				width: 40%
			}
		</style>
		<script type="text/javascript">
			function add_go(f) {
				f.action="ex09_3.jsp";
				f.submit();
			}
			function calc() {
				location.href="ex09_4.jsp";
			}
			function logout() {
				location.href="ex09_5.jsp";
			}
		</script>
	</head>
	<body>
		<%-- 원래는 DB처리를 해야 하지만 일단은 야매로 만들어 보자 --%>
		<div>
			<h2>상품 선택</h2>
			<hr />
			<%= session.getAttribute("name") %>님 로그인 성공하셨습니다.
			<hr />
			<form>
				<select name="product">
					<option>::선택하세요</option>
					<option value="망고">망고</option>
					<option value="키위">키위</option>
					<option value="대추야자">대추야자</option>
					<option value="바나나">바나나</option>
					<option value="두리안">두리안</option>
				</select>
				<input type="button" value="추가" onclick="add_go(this.form)" />
			</form>
			<p><button onclick="calc()">계산</button>
				<button onclick="logout()">로그아웃</button></p>
		</div>
	</body>
</html>