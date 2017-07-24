<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BBS_VO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = getServletContext().getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(
				request,
				path,
				500*1024*1024,
				"utf-8",
				new DefaultFileRenamePolicy()
			);
	BBS_VO bvo = new BBS_VO();
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setContent(mr.getParameter("content"));
	bvo.setPwd(mr.getParameter("pwd"));
	bvo.setIp(request.getRemoteAddr());
	
	// 파일 처리
	if(mr.getFilesystemName("file_name") != null){
		bvo.setFile_name(mr.getFilesystemName("file_name"));
	}else{
		bvo.setFile_name("");
	}
	
	int result = DAO.getInsert(bvo);
	if(result>0){
		response.sendRedirect("list.jsp");
	}else{%>
		<script>
			alert("작성실패");
			history.go(-1);
		</script>
	<%}
%>