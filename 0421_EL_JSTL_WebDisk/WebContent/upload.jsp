<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cPath = request.getParameter("cPath");
	session.setAttribute("cPath", cPath);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="upload_ok.jsp">
		<input type="file" name="up_file"/>
		<input type="submit" value="업로드"/>
	</form>
</body>
</html>