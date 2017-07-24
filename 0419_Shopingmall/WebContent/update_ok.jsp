<%@page import="com.hb.myshopingmall.DAO"%>
<%@page import="com.hb.myshopingmall.MemberVO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = getServletContext().getRealPath("/upload/member/"+request.getParameter("photo2"));
	File file = new File(path);
	file.mkdirs();
	MultipartRequest mr = new MultipartRequest(
				request,
				path,
				500*1024*1024,
				"utf-8",
				new DefaultFileRenamePolicy()
			);
	MemberVO mvo = new MemberVO();
	mvo.setMemberidx(mr.getParameter("memberidx"));
	mvo.setName(mr.getParameter("name"));
	mvo.setAge(mr.getParameter("age"));
	mvo.setGender(mr.getParameter("gender"));
	
	if(mr.getFilesystemName("photo2") != null){
		mvo.setPhoto(mr.getFilesystemName("photo2"));
	}else{
		mvo.setPhoto(mr.getParameter("photo"));
	}
	if(mr.getParameter("email") != null){
		mvo.setEmail(mr.getParameter("email"));
	}else{
		mvo.setEmail("");
	}
	
	int result = DAO.getUpdate(mvo);
	if(result>0){
		response.sendRedirect("login.jsp");
	}else{%>
		<script type="text/javascript">
			alert("수정 실패");
			history.go(-1);
		</script>
	<%}
%>