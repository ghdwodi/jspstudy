<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SELECT *</title>
	</head>
	<body>
	<%
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "1111";
			conn = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from hbmember order by idx";
			ptmt = conn.prepareStatement(sql);
			rs = ptmt.executeQuery();
	%>
		<div>
			<h2>전체보기</h2>
			<table id="ex01">
				<thead>
					<tr>
						<th>IDX</th><th>ID</th><th>PWD</th><th>NAME</th><th>AGE</th><th>ADDR</th>
					</tr>
				</thead>
				<tbody>
				<%
					while(rs.next()){%>
						<tr>
							<td><%= rs.getInt(1) %></td>
							<td><%= rs.getString(2) %></td>
							<td><%= rs.getString(3) %></td>
							<td><%= rs.getString(4) %></td>
							<td><%= rs.getInt(5) %></td>
							<td><%= rs.getString(6) %></td>
						</tr>	
					<%}
					%>
				</tbody>
			</table>
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
		</div>
	</body>
</html>