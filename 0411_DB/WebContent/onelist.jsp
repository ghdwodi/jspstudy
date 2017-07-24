<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
		String sql = "select * from hbmember where idx=?";
		ptmt = conn.prepareStatement(sql);
		ptmt.setInt(1, Integer.parseInt(idx));
		rs = ptmt.executeQuery();
		%>
		<form>
			<table>
				<thead>
					<tr><td colspan="2">개인정보 확인</td></tr>
				</thead>
				<tbody>
				<%
					while(rs.next()){
						%>
						<tr>
						<td>회원번호</td><input type='hidden' value=<%=rs.getInt("idx")%> name='idx' /></td>
						</tr>
						<tr>
						<td>아이디</td><td><%=rs.getString("id") %></td>
						</tr>
						<tr>
						<td>이름</td><td><input type='text' value=<%=rs.getString("name") %> name='name' /></td>
						</tr>
						<tr>
						<td>나이</td><td><input type='number' value=<%=rs.getInt("age") %> name='age' /></td>
						</tr>
						<tr>
						<td>주소</td><td><input type='text' value='<%=rs.getString("addr") %>' name='addr' /></td>
						</tr>
						<%
					}
				%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<a href="list.jsp">돌아가기</a>
							<input type="button" value="회원정보 수정" onclick="update_go(this.form)" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
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
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상세정보보기</title>
		<style type="text/css">
			table, tr, td{border: 1px solid black}
			table{text-align: center;}
		</style>
		<script type="text/javascript">
			function update_go(f) {
				if(f.name.value==""){
					alert("이름을 입력하세요.");
					f.name.focus();
					return;
				}
				if(f.age.value==""){
					alert("나이를 입력하세요.");
					f.age.focus();
					return;
				}
				if(f.addr.value==""){
					alert("아이디를 입력하세요.");
					f.addr.focus();
					return;
				}
				f.action="update.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
	
	</body>
</html>