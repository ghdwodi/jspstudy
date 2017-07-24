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
		<title>회원목록</title>
		<style type="text/css">
			table, tr, td{border: 1px solid black}
			div{text-align: center;}
		</style>
	</head>
	<body>
		<%
		String res = (String)session.getAttribute("chk");
		if(res==null){%>
			<script type="text/javascript">
				alert("로그인 하세요");
				location.href="index.jsp";
			</script>
		<%}else if(res.equals("ok")){
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
				String sql = "select * from hbmember order by idx";
				ptmt = conn.prepareStatement(sql);
				rs = ptmt.executeQuery();
				
			%>
				<table>
					<thead>
						<tr>
							<th>아이디</th><th>이름</th><th>삭제 여부</th>
						</tr>
					</thead>
					<tbody>
					<%
						while(rs.next()){
							out.println("<tr>");
							out.println("<td><a href='onelist.jsp?idx="+rs.getInt("idx")+"'>"+rs.getString("id")+"</a></td>");
							out.println("<td>"+rs.getString("name")+"</td>");
							out.println("<td><a href='dellist.jsp?idx="+rs.getInt("idx")+"'>삭제</a></td>");
							out.println("<tr>");
						}
					%>
					</tbody>
				</table>
			<%
			}catch(Exception e){
			}finally{
				try{
					rs.close();
					ptmt.close();
					conn.close();
				}catch(Exception e2){
				}
			}
		}
		%>
	</body>
</html>