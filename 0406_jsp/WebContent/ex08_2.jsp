<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 원래는 DB와 연동해서 로그인 성공 유무를 확인해야 한다.
	if (id.equals("ghdwo1987") && pw.equals("1111")){
		session.setAttribute("id_chk", "ok");
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		response.sendRedirect("ex08_1.jsp");
	} else {
		session.setAttribute("id_chk", "err");
		response.sendRedirect("ex08_1.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>