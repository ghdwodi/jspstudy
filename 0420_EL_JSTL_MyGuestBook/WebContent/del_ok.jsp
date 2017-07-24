<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="com.hb.myguestbook.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	// insert, delete, update는 수동커밋이 기본 => 반드시 나중에 커밋
	int result = DAO.getDelete(request.getParameter("idx"));
	pageContext.setAttribute("result", result);
%>
<c:choose>
	<c:when test="${result>0}">
		<script>
			location.href="list.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("삭제 실패");
			location.href="list.jsp";
		</script>
	</c:otherwise>
</c:choose>