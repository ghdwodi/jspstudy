<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기본 내장 객체 : response</title>
		<script type="text/javascript">
			function send_go() {
				location.href="ex04_3.jsp";
			}
			// form이 없으므로 action을 사용하지 못한다.
			function send_go2() {
				location.href="ex04_3.jsp?id=<%=id%>&pw=<%=pw%>";
			}
		</script>
	</head>
	<body>
		<h1>파라미터 결과 보기</h1>
		<h2>아이디 : <%= id %></h2>
		<h2>비밀번호 : <%= pw %></h2>
		<h2><a href="ex04_3.jsp">a태그를 이용해 다른 페이지로 이동1</a></h2>
		<h2><a href="ex04_3.jsp?id=<%=id%>&pw=<%=pw%>">a태그를 이용해 다른 페이지로 이동2</a></h2>

		<%-- 자바스크립트를 이용한 이동 --%>
		<button onclick="send_go()">버튼 태그를 이용해 다른 페이지로 이동1</button>
		<input type="button" value="버튼 태그를 이용해 다른 페이지로 이동2" onclick="send_go2()" />
		
		<%-- jsp를 이용한 이동 --%>
		<%-- 리다이렉트 : response 객체 사용 --%>
<%--	<% response.sendRedirect("ex04_3.jsp?id="+id+"&pw="+pw); %>
--%>
		<%-- 넘어간 페이지에서 request와 response가 새로 생성된다. --%>
		
		<%-- 포워드 : request 객체 사용 --%>
		<% request.getRequestDispatcher("ex04_3.jsp").forward(request, response); %>
	</body>
</html>