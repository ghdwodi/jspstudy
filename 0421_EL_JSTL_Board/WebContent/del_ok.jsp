<%@page import="com.hb.mybbs.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	int result = DAO.getDelete(request.getParameter("seq"));
	pageContext.setAttribute("result", result);
%>
<c:choose>
	<c:when test="${result>0}">
		<script type="text/javascript">
			location.href = "list.jsp?cPage=${cPage}";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("삭제 실패");
			location.href = "list.jsp?cPage=${cPage}";
		</script>
	</c:otherwise>
</c:choose>