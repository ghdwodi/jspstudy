<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String product = request.getParameter("product");
	// 세션에 있는 p_list를 ArrayList에 저장
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("p_list");
	// 처음 넘어오면 무조건 null이므로 list가 만들어진다.
	if(list==null){
		list = new ArrayList<String>();
		session.setAttribute("p_list", list);
	}
	list.add(product);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			alert("<%=product%>가 추가되었습니다.");
			history.go(-1);	// 직전 페이지로 이동하기
		</script>
	</head>
	<body>
		<%-- 리다이렉트, 포워드 --%>
		<%-- response.sendRedirect("ex09_2.jsp") --%>
		<!-- 리다이렉트 :  자바스크립트 실행 안됨, name도 지워짐 -->
		<%--
		request.getRequestDispatcher("ex09_2.jsp").forward(request, response);
		--%>
	</body>
</html>