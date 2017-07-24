<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>액션 태그</title>
	</head>
	<body>
		<h3>여기는 ex03페이지입니다.</h3>
		<h3>
			이름 : <%=name %>
			나이 : <%=age %>
		</h3>
	</body>
</html>