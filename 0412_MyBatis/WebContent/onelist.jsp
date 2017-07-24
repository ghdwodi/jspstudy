<%@page import="com.hb.mybatis.VO"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세검색</title>
</head>
<body>
	<jsp:include page="index.jsp" />
	<br />	<br />
	<hr />
	
	<%
		SqlSession ss = DBService.getFactory().openSession();
		VO vo = ss.selectOne("onelist", request.getParameter("id"));
	%>
	<div>
	<h1> 상세 보기 </h1>
	 <%if(vo != null){%>
	 	<h2>
	 		<ul>
				 <li><%=vo.getIdx()%>&nbsp;&nbsp;	
				 	 <%=vo.getId()%>&nbsp;&nbsp;	
				 	 <%=vo.getPwd()%>&nbsp;&nbsp;	
				 	 <%=vo.getName()%>&nbsp;&nbsp;	
				 	 <%=vo.getAge()%>&nbsp;&nbsp;	
				 	 <%=vo.getAddr()%>
				 </li>	
	 		</ul>
	    </h2>
	 <%}else{ %> 
	 	<h2> 자료 없음 </h2>
	 <%}%>
	 
	 <% ss.close(); %>
	 </div>	
</body>
</html>













