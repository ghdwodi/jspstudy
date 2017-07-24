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
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
			
			String sql = "insert into hbmember values (hbmember_seq.nextval,?,?,?,?,?)";
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, id);
			ptmt.setString(2,pw);
			ptmt.setString(3, name);
			ptmt.setInt(4, Integer.parseInt(age));
			ptmt.setString(5, addr);
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