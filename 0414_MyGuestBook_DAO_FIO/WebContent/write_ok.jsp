<%@page import="com.hb.myguestbook.VO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%-- enctype="multipart/form-data"로 넘어왔으므로 자바 UseBean은 쓸 수 없다. --%>
<%
	String path = getServletContext().getRealPath("/upload");
	// System.out.println(path);
	MultipartRequest mr = new MultipartRequest(
				request,			// MultipartRequest와 servlet의 request 연결
				path,				// 실제 저장 위치값
				100*1024*1024,		// 업로드할 수 있는 용량 100MB
				"utf-8",			// 인코딩
				new DefaultFileRenamePolicy()	// 파일이름 중복 처리방식
			);
	
	VO vo1 = new VO();
	vo1.setName(mr.getParameter("name"));vo1.setSubject(mr.getParameter("subject"));
	vo1.setContent(mr.getParameter("content"));vo1.setPwd(mr.getParameter("pwd"));
	vo1.setEmail(mr.getParameter("email"));
	
	if (mr.getFile("filename")!=null){
		vo1.setFilename(mr.getFilesystemName("filename"));
	} else {
		vo1.setFilename("");
	}
	
	int result = DAO.getInsert(vo1);
	if(result>0){
		response.sendRedirect("list.jsp");
	}else{%>
		<script type="text/javascript">
		alert("작성 실패");
		location.href="list.jsp";
		</script>
	<%}
%>