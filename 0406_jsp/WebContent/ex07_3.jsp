<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%-- 세션 속성 삭제하기 : removeAttribute --%>
		<%
		session.removeAttribute("name");
		session.removeAttribute("age");
		response.sendRedirect("ex07_1.jsp");
		%>
	</body>
</html>