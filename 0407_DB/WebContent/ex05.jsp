<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색</title>
		<style type="text/css">
			div{
				align: left;
				text-align: center;
			}
			table,th,td {
				border: 1px solid black;
				align: center;
			}
			table{
				align: center;
				width: 600px;
			}
		</style>
	</head>
	<body>
	<%@ include file="ex02.jsp" %>
	<%
		/* Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null; */
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "1111";
			conn = DriverManager.getConnection(url, user, password);
			
			String sql = "delete from hbmember where id=? and pwd=?";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setString(2, pw);
			int result = ptmt.executeUpdate();
	%>
		
		<%} catch (Exception e){
			System.out.println("DB오류 : "+e);
		} finally{
			try{
				rs.close();
				ptmt.close();
				conn.close();
			} catch (Exception e2){
				
			}
		}%>
		<script type="text/javascript">
			if(result>0){
				alert("가입 성공");
			} else {
				alert("가입 실패");
			}
		</script>
		<%response.sendRedirect("ex02.jsp");%>
	</body>
</html>