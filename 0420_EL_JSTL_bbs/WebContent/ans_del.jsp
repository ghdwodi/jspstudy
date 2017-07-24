<%@page import="com.hb.mybbs.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="vo" class="com.hb.mybbs.Comm_VO" />
<jsp:setProperty property="*" name="vo" />
<%
	// 글에 댓글이 있는 경우 무결성 참조 오류가 발생함에 주의
	int result = DAO.getCommDelete(vo.getC_idx());
	if (result > 0) {
		response.sendRedirect("view.jsp?b_idx="+vo.getB_idx());
	} else {
%>
	<script type="text/javascript">
		alert("삭제 실패");
		location.href = "list.jsp";
	</script>
<%
	}
%>