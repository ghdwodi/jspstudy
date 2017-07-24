<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	
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
		String sql = "insert into hbmember values("+
				"hbmember_seq.nextval,?,?,?,?,?)";
		ptmt = conn.prepareStatement(sql);
		ptmt.setString(1, id);
		ptmt.setString(2, pwd);
		ptmt.setString(3, name);
		ptmt.setInt(4, age);
		ptmt.setString(5, addr);
		int res = ptmt.executeUpdate();
		
		if(res>0){
		%>
			<script type="text/javascript">
				alert("회원가입 성공");
				location.href="index.jsp";
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("회원가입 실패");
				location.href="add.jsp";
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
	</head>
	<body>
	
	</body>
</html>