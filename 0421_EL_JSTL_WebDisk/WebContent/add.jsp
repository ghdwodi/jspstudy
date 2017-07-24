<%@page import="java.io.File"%>
<%@page import="com.hb.mywebdisk.VO"%>
<%@page import="com.hb.mywebdisk.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="joinVO" class="com.hb.mywebdisk.VO" />
<jsp:setProperty property="*" name="joinVO"/>
<%
	if(joinVO.getAge()==null){
		joinVO.setAge("");
	}
	if(joinVO.getAddr()==null){
		joinVO.setAddr("");
	}
	int result = DAO.getInsert(joinVO);
	if(result>0){
		// 회원가입 성공시 member폴더 안에 ID폴더를 만들어줘야 한다.
		String path = getServletContext().getRealPath("/member/"+joinVO.getId());
		File file = new File(path);
		file.mkdirs();
		response.sendRedirect("index.jsp");
	}else{%>
		<script type="text/javascript">
			alert("회원가입 실패");
			history.go(-1);
		</script>
	<%}
%>