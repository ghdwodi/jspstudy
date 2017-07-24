<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "ex10_3.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>오류 처리 : 오류 페이지 만들기</title>
	</head>
	<body>
		name 파라미터값 : <%= request.getParameter("name").toUpperCase() %>
	</body>
</html>