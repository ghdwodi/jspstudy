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
		<script type="text/javascript">
			function update_go(f) {
				f.action="ex07.jsp";
				f.submit();
			}
		</script>
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
			
			String sql = "select * from hbmember where id=? and pwd=?";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setString(2, pw);
			rs = ptmt.executeQuery();
	%>
		<div>
			<h2>회원 검색 결과 보기</h2>
				<table>
					<thead>
						<tr>
							<th>IDX</th><th>NAME</th><th>AGE</th><th>ADDR</th>
						</tr>
					</thead>
					<tbody>
						<form>
						<%while(rs.next()){%>
							<tr>
								<td><%= rs.getInt(1) %>
								<input type="hidden" name="id" value="<%= rs.getString(2) %>" />
								<input type="hidden" name="pw" value="<%= rs.getString(3) %>" /></td>
								<td><input type="text" name="name" value="<%= rs.getString(4) %>" /></td>
								<td><input type="number" name="age" value="<%= rs.getInt(5) %>" /></td>
								<td><input type="text" name="addr" value="<%= rs.getString(6) %>" /></td>
								<td><input type="button" value="갱신" onclick="update_go(this.form)" /></td>
							</tr>	
						<%} %>
						</tbody>
					</form>
				</table>
		<%
		} catch (Exception e){
			System.out.println("DB오류 : "+e);
		} finally{
			try{
				rs.close();
				ptmt.close();
				conn.close();
			} catch (Exception e2){
				
			}
		}
		%>
		</div>
	</body>
</html>