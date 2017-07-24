<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>계산</h2>
		<h3>선택한 품목</h3>
		<hr />
		<%
			ArrayList<String> list = (ArrayList)session.getAttribute("p_list");
			if(list==null){
				out.print("<h3>선택한 상품이 없습니다.</h3>");
			} else {
				out.print("<ul>");
				for(String k : list){
					out.print("<li>"+k+"</li>");
				}
				out.print("</ul?");
			}
		%>
	</body>
</html>