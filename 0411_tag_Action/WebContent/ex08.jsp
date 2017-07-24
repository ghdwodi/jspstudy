<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>일반적인 파라미터 처리</h2>
		이름 : <%= request.getParameter("name") %>
		나이 : <%= request.getParameter("age") %>
		<hr />
		<h2>속성을 이용한 파라미터 처리</h2>
		<%
			request.setAttribute("name", request.getParameter("name"));
			request.setAttribute("age", request.getParameter("age"));
			session.setAttribute("name", request.getParameter("name"));
			session.setAttribute("age", request.getParameter("age"));
		%>
		이름 : <%= request.getAttribute("name") %>
		나이 : <%= request.getAttribute("age") %>
		<br />
		이름 : <%= session.getAttribute("name") %>
		나이 : <%= session.getAttribute("age") %>
		<hr />
		<h2>자바Bean을 이용한 파라미터 처리</h2>
		<%--
		자바Bean : jsp에서 데이터를 저장할 목적으로 제공되는 저장공간
		사용순서 : 1. 무조건 VO부터 만든다.(변수들은 파라미터의 이름과 같아야 한다.)
				2. 자바Bean 생성(<jsp:useBean>액션 이용)
					<jsp:useBean id="별칭" class="VO위치" scope="생명주기"></jsp:useBean>
					scope : page(기본) < request < session < application
				3. setProperty : setter를 호출해 파라미터값을 모두 VO에 넣는다.
					<jsp:setProperty property="*" name="useBean의 id"/>
					파라미터 이름과 변수 이름이 같으면 '*'을 사용한다.
				4. getProperty : getter를 호출해 값을 불러온다.
					<jsp:getProperty property="변수이름" name="useBean의 id"/>
					그냥 jsp로 getter를 사용할 수도 있다. 이미 객체 생성이 된 상태이기 때문이다.
		--%>
		<jsp:useBean id="vo" class="com.hb.am.VO" scope="page"></jsp:useBean>
		<jsp:setProperty property="*" name="vo"/>
		이름 : <jsp:getProperty property="name" name="vo"/>
		나이 : <jsp:getProperty property="age" name="vo"/>
		<br />
		이름 : <%= vo.getName() %>
		나이 : <%= vo.getAge() %>
	</body>
</html>