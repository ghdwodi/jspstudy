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
		<title>액션태그</title>
	</head>
	<body>
		<h2>여기는 ex06 페이지</h2>
		<h2>
			이름 : <%=name %>
			나이 : <%=age %>
		</h2>
	</body>
</html>