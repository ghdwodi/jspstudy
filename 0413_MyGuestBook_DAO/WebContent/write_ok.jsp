<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="vo1" class="com.hb.myguestbook.VO" />
<jsp:setProperty property="*" name="vo1"/>
<%
	int result = DAO.getInsert(vo1);
	if(result>0){
		response.sendRedirect("list.jsp");
	}else{%>
		<script type="text/javascript">
		alert("작성 실패");
		location.href="list.jsp";
		</script>
	<%}
%>