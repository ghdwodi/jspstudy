<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%-- request에 데이터 저장 --%>
		<% request.setAttribute("addr", "서울"); %>
		<%-- 세션에 데이터를 저장 --%>
		<%
		session.setAttribute("name", "태권브이");
		session.setAttribute("age", 27);
		response.sendRedirect("ex07_1.jsp");
		%>
	</body>
</html>