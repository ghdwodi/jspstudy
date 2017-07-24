<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<jsp:useBean id="vo" class="com.hb.am.VO" scope="page"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<%
	String id = vo.getId();
	String pwd = vo.getPwd();
	String name = vo.getName();
	int age = Integer.parseInt(vo.getAge());
	String addr = vo.getAddr();
	
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
		
		if(res>0){%>
			<script type="text/javascript">
				alert("회원가입 성공");
				location.href="index.jsp";
			</script>
		<%} else {%>
			<script type="text/javascript">
				alert("회원가입 실패");
				location.href="add.jsp";
			</script>
		<%}
	} catch (Exception e) {
	} finally {
		try{
		} catch(Exception e2){
		}
	}
	%>
	</body>
</html>