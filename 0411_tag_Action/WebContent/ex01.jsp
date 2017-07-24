<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>액션 태그</title>
	</head>
	<body>
		<%--
		액션 태그 : jsp페이지 간의 흐름 제어, 자바 빈즈 컴포넌트와 상호 지원
		<jsp : 액션명령></액션명령>
		--%>
		<h1>여기는 ex01페이지입니다.</h1>
		<hr />
		<%-- include는 지시어와 액션 두 가지가 있다. --%>
		<h2>지시어 : 파라미터 전달 불가능</h2>
		<%@ include file="ex02.jsp" %>
		<%@ include file="ex03.jsp" %>
		<hr />
		<h2>액션 : 파라미터 전달 가능</h2>
		<jsp:include page="ex02.jsp"></jsp:include>
		<jsp:include page="ex03.jsp">
			<jsp:param value="홍길동" name="name"/>
			<jsp:param value="18" name="age"/>
		</jsp:include>
	</body>
</html>