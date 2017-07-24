<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
%>
<%-- 기본적으로 request.getParameter를 이용해 파라미터값을 받으면 안 된다. --%>
<%-- <jsp:useBean>도 사용할 수 없다. --%>
<%--
	<h2>이름 : <%= name %></h2>
	<h2>파일이름 : <%= f_name %></h2>
--%>
<%
	// 실제 저장위치 디렉토리 구하기(톰캣 어딘가에 존재)
	String path = getServletContext().getRealPath("/upload");
	// System.out.println(path);
	MultipartRequest mr = new MultipartRequest(
				request,			// MultipartRequest와 servlet의 request 연결
				path,				// 실제 저장 위치값
				100*1024*1024,		// 업로드할 수 있는 용량 100MB
				"utf-8",			// 인코딩
				new DefaultFileRenamePolicy()	// 파일이름 중복 처리방식
			);
	
	// <MultipartRequest 주요 메소드> 
	// 1. getParameter(String) : String
	// 2. getParameterValues(String) : String[]
	// 3. getOriginalFileName(String) : 업로드 당시 파일 이름
	// 4. getFilesystemName(String) : 저장 당시 파일 이름
	// 5. getContentType(String) : 업로드 된 파일 MIME타입
	// 6. getFile(String) : File => 업로드 된 파일 자체를 파일 클래스로 처리
%>
<h1>결과 보기</h1>
<h2>
	<ul>
		<li>올린 사람 : <%= mr.getParameter("name") %></li>
		<li>파일 원본이름 : <%= mr.getOriginalFileName("f_name") %></li>
		<li>파일 저장이름 : <%= mr.getFilesystemName("f_name") %></li>
		<li>파일 MIME타입 : <%= mr.getContentType("f_name") %></li>
		<hr />
		<%
			File file = mr.getFile("f_name");
		%>
		<li>파일 이름 : <%= file.getName() %></li>
		<li>파일 크기 : <%= file.length()/1024 %>KB</li>
		<%-- file.lastModified() <= 1970년 1월 1일을 기준으로 한 milisecond값 --%>
		<%
			SimpleDateFormat day = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
		%>
		<li>파일 마지막 수정 날짜 : <%= day.format(file.lastModified()) %></li>
		<li>다운로드 : <a href="download.jsp?path=upload&f_name=<%= mr.getFilesystemName("f_name") %>"><%= mr.getFilesystemName("f_name") %></a></li>
	</ul>
</h2>