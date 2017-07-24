<%@page import="com.hb.mybbs.DAO"%>
<%@page import="com.hb.mybbs.BoardVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cPage = (String)session.getAttribute("cPage");
	String path = getServletContext().getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(
				request,
				path,
				500*1024*1024,
				"utf-8",
				new DefaultFileRenamePolicy()
			);
	BoardVO bvo = new BoardVO();
	bvo.setTitle(mr.getParameter("title"));
	bvo.setContent(mr.getParameter("content"));
	if(mr.getFilesystemName("filename") != null){
		bvo.setFilename(mr.getFilesystemName("filename"));
	}else{
		bvo.setFilename(mr.getParameter("filename2"));
	}
	bvo.setSeq(mr.getParameter("seq"));
	
	int result = DAO.getModify(bvo);
	if(result>0){
		response.sendRedirect("view.jsp?seq="+bvo.getSeq()+"&cPage="+cPage);
	}else{%>
		<script type="text/javascript">
			alert("작성 실패");
			history.go(-1);
		</script>
	<%}
%>