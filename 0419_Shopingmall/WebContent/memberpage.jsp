<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String memberidx = request.getParameter("memberidx");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인</title>
		<script type="text/javascript">
			function memberinfo_go(f) {
				f.action = "memberinfo.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<%int chk = -1;
		if(session.getAttribute("login_chk")!=null){
			chk = (int)session.getAttribute("login_chk");
		}
		if(chk==-1){%>
			<script type="text/javascript">
				alert("로그인을 하십시오.");
				location.href="login.jsp";
			</script>
		<%}else{%>
		<form method="post">
			<fieldset>
				<legend><%=name%> 님 환영합니다.</legend>
				<input type="button" value="로그아웃" onclick="javascript:location.href='logout.jsp'">
				<input type="button" value="쇼핑몰 입장" onclick="javascript:location.href='product_list.jsp'">
				<input type="button" value="회원정보 보기" onclick="memberinfo_go(this.form)">
				<%if(memberidx.equals("0")){%>
					<input type="button" value="물품 등록" onclick="javascript:location.href='enrollproduct.jsp'">
				<%}%>
				<input type="hidden" name="memberidx" value="<%=memberidx%>">
			</fieldset>
		</form>
		<%}%>
	</body>
</html>