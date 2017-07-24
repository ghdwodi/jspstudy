<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<jsp:useBean id="vo2" class="com.hb.myguestbook.VO" />
<jsp:setProperty property="*" name="vo2"/>
<%
	int result = DAO.getUpdate(vo2);
	pageContext.setAttribute("result", result);
%>
<c:choose>
	<c:when test="${result>0}">
		<script>
			location.href="onelist.jsp?idx=${vo2.idx}";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("수정 실패");
			location.href="list.jsp";
		</script>
	</c:otherwise>
</c:choose>