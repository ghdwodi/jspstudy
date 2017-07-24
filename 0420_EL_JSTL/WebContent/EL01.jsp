<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EL(표현언어)</title>
	</head>
	<body>
		<%--
		EL(표현언어)
		- JSP에서 사용가능한 새로운 스크립트 언어이다.
		- 4가지 영역의 속성(scope)을 사용한다.(PageContext, request, session, application)
		- 속성 이름이 같을 경우 PageContext > request > session > application 순이다.
		- 사용법 : <%=변수%>,<%=계산식%> 대신 ${변수},#{계산식}
				반드시 위 4가지 속성에 변수가 존재해야 사용할 수 있다.
		- 파라미터값은 별도로 속성에 저장하지 않아도 된다. EL 내장객체 중 param, paramValues을 사용하기 때문이다.
		--%>
		<h2>표현식 산술연산 사용 예제</h2>
		<h3>
			<ul>
				<li>15+7=<%=15+7%></li>
				<li>15-7=<%=15-7%></li>
				<li>15*7=<%=15*7%></li>
				<li>15/7=<%=15/7%></li>
				<li>15%7=<%=15%7%></li>
			</ul>
		</h3>
		<hr />
		<h2>EL 산술연산 사용 예제</h2>
		<h3>
			<ul>
				<li>15+7=${15+7}</li>
				<li>15-7=${15-7}</li>
				<li>15*7=${15*7}</li>
				<li>15/7=${15/7}</li>
				<li>15%7=${15%7}</li>
			</ul>
		</h3>
		<hr />
		<%!int su = 125+25;%>
		<%pageContext.setAttribute("su", su); %>
		<%-- 속성에 저장하지 않으면 EL은 인식하지 못한다. --%>
		<h3>
			<ul>
				<li>125+25=<%=su%></li>
				<li>125+25=${su}</li>
			</ul>
		</h3>
		<hr />
		<%
			// 속성들의 이름은 같으나 값이 다를 경우 우선순위에 따라 결정
			pageContext.setAttribute("pc", "i3");
			request.setAttribute("pc", "i5");
			session.setAttribute("pc", "i7");
		%>
		<h3>
			<ul>
				<li>그냥 호출 : ${pc}</li>
				<li>pageContext : ${pageScope.pc}</li>
				<li>request : ${requestScope.pc}</li>
				<li>session : ${sessionScope.pc}</li>
			</ul>
		</h3>
	</body>
</html>