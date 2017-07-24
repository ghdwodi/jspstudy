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
		<script type="text/javascript">
			function ex06_go() {
				location.href="ex06.jsp";
			}
			function ex06_go2() {
				location.href="ex06.jsp?name=<%=name%>&age=<%=age%>";
			}
		</script>
	</head>
	<body>
		<h2> 여기는 ex05페이지 입니다. </h2>
		<%-- 페이지 이동 : 링크, 리다이렉트, 포워드,  --%>
		
		<%-- 파라미터값이 없을때 --%>
		<a href="ex06.jsp">ex06으로 이동하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="ex06_go()">ex06이동</button>
		<%-- <% response.sendRedirect("ex06.jsp"); %> --%>
		<%-- <% request.getRequestDispatcher("ex06.jsp").forward(request, response); %> --%>
		
		
		<!-- 강제로 파라미터값 넣기 -->
		<a href="ex06.jsp?name=<%=name%>&age=<%=age%>"> ex06으로 이동하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="ex06_go2()">ex06이동</button>
		<%-- <% response.sendRedirect("ex06.jsp"); %> --%>
		<%--  <% response.sendRedirect("ex06.jsp?name='홍길동'&age=''"); %> --%>
		<%--    <% request.getRequestDispatcher("ex06.jsp").forward(request, response); %> --%>
		
		<%-- 액션 : forward 존재 : request가 살아서 간다. --%>
		<jsp:forward page="ex06.jsp" />
	</body>
</html>