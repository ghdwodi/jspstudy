<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="vo" class="com.hb.EL.VO"/>
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>결과 보기</h2>
		<h3>
			<ul>
				<li>이름 : <%=vo.getName()%></li>
				<li>나이 : <%=vo.getAge()%></li>
				<li>성별 : <%=vo.getGender()%></li>
				<li>취미
					<ul>
					<%for(String k : vo.getHobby()){%>
						<li><%=k%></li>
					<%}%>
					</ul>
				</li>
				<li>주소 : <%=vo.getAddr()%></li>
				<li>애완동물
					<ul>
					<%for(String k : vo.getAni()){%>
						<li><%=k%></li>
					<%}%>
					</ul>
				</li>
			</ul>
		</h3>
	</body>
</html>