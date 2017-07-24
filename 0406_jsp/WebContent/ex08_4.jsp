<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>로그인 성공!</h2>
		<%
			String id = (String)session.getAttribute("id");
			String pw = (String)session.getAttribute("pw");
		%>
		<p>ID : <%= id %></p>
		<p>PW : <%= pw %></p>
	</body>
</html>