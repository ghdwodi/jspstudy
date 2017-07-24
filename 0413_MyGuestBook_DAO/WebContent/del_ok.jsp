<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="com.hb.myguestbook.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="vo3" class="com.hb.myguestbook.VO" />
<jsp:setProperty property="*" name="vo3" />
<%
	// insert, delete, update는 수동커밋이 기본 => 반드시 나중에 커밋
	int result = DAO.getDelete(request.getParameter("idx"));
	if (result > 0) {
		response.sendRedirect("list.jsp");
	} else {
%>
	<script type="text/javascript">
		alert("삭제 실패");
		location.href = "list.jsp";
	</script>
<%
	}
%>