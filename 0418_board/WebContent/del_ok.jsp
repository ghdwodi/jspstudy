<%@page import="com.hb.mybbs.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String cPage = (String)session.getAttribute("cPage");
	// 글에 댓글이 있는 경우 무결성 참조 오류가 발생함에 주의
	int result = DAO.getDelete(request.getParameter("seq"));
	if (result > 0) {
		response.sendRedirect("list.jsp?cPage="+cPage);
	} else {%>
	<script type="text/javascript">
		alert("삭제 실패");
		location.href = "list.jsp?cPage=<%=cPage%>";
	</script>
	<%}
%>