<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String address = request.getParameter("address");
	String gender = request.getParameter("gender");
	String addr2 = request.getParameter("addr2");
	String[] hobby = request.getParameterValues("hobby");
	String[] play = request.getParameterValues("play");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결과보기</h1>
	<h2>
		<ul>
			<li>이름 : <%= name %></li>
			<li>나이 : <%= age %></li>
			<li>주소 : <%= address %></li>
			<li>성별 : <%= gender %></li>
			<li>취미
				<ul style="list-style-type:square;">
					<%
					for(String k :hobby){
						out.print("<li>"+k+"</li>");
					}
					%>
				</ul>
			</li>
			<li>거주지 : <%= addr2 %></li>
			<li>운동
				<ul style="list-style-type:square;">
					<%
					for(String k :play){
						out.print("<li>"+k+"</li>");
					}
					%>
				</ul>
			</li>
		</ul>
	</h2>
</body>
</html>