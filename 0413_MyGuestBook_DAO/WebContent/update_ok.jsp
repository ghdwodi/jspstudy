<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<jsp:useBean id="vo2" class="com.hb.myguestbook.VO" />
<jsp:setProperty property="*" name="vo2"/>
<%
	int result = DAO.getUpdate(vo2);
	if(result>0){
		String idx = vo2.getIdx();
		response.sendRedirect("onelist.jsp?idx="+idx);
	}else{%>
		<script type="text/javascript">
			alert("갱신 실패");
			location.href="list.jsp";
		</script>
	<%}
%>