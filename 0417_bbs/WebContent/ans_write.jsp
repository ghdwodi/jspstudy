<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BBS_VO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="cvo" class="com.hb.mybbs.Comm_VO" />
<jsp:setProperty property="*" name="cvo" />
<%
	cvo.setIp(request.getRemoteAddr());	
	int result = DAO.getCommentInsert(cvo);
	if(result>0){
		response.sendRedirect("view.jsp?b_idx="+cvo.getB_idx());
	}else{%>
		<script>
			alert("작성실패");
			history.go(-1);
		</script>
	<%}
%>