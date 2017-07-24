<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	int idx = Integer.parseInt(request.getParameter("idx"));
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
		String sql = "update hbmember set name=?,age=?,addr=? where idx=?";
		ptmt = conn.prepareStatement(sql);
		ptmt.setString(1, name);
		ptmt.setInt(2, age);
		ptmt.setString(3, addr);
		ptmt.setInt(4, idx);
		int res = ptmt.executeUpdate();
		
		if(res>0){
		%>
			<script type="text/javascript">
				alert("수정 성공");
				location.href="list.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("수정 실패");
				history.go(-1);
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
		<title>Insert title here</title>
		<style type="text/css">
			table, tr, td{border: 1px solid black}
			table{text-align: center;}
		</style>
	</head>
	<body>
	
	</body>
</html>