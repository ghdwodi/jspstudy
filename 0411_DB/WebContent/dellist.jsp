<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	// DB 필수요소
	Connection conn = null;
	PreparedStatement ptmt = null;
	ResultSet rs = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "1111";
		
		conn = DriverManager.getConnection(url, user, password);
		String sql = "delete from hbmember where idx=?";
		ptmt = conn.prepareStatement(sql);
		ptmt.setInt(1, Integer.parseInt(idx));
		int res = ptmt.executeUpdate();
		
		if(res>0){
			%>
				<script type="text/javascript">
					alert("삭제 성공");
					location.href="list.jsp";
				</script>
			<%}else{%>
				<script type="text/javascript">
					alert("삭제 실패");
					location.href="list.jsp";
				</script>
			<%}
	}catch(Exception e){
		
	}finally{
		try{
			rs.close();
			ptmt.close();
			conn.close();
		}catch(Exception e2){
			
		}
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>삭제</title>
	</head>
	<body>
		
	</body>
</html>