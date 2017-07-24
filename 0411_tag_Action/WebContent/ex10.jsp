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
		<jsp:useBean id="vo2" class="com.hb.am.VO2" scope="page"></jsp:useBean>
		<jsp:setProperty property="*" name="vo2"/>
		<h2>
			<ul>
				<li>이름 : <%= vo2.getName() %></li>
				<li>나이 : <%= vo2.getAge() %></li>
				<li>주소 : <%= vo2.getAddr() %></li>
				<li>성별 : <%= vo2.getGender() %></li>
				<li>취미
					<ul>
					<%
						for(String k : vo2.getHobby()){
							out.println("<li>"+k+"</li>");
						}
					%>
					</ul>
				</li>
				<li>거주지 : <%= vo2.getAddr2() %></li>
				<li>운동
					<ul>
					<%
						for(String k : vo2.getPlay()){
							out.println("<li>"+k+"</li>");
						}
					%>
					</ul>
				</li>
			</ul>
		</h2>
	</body>
</html>