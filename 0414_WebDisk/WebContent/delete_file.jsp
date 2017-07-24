<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
    String cPath = request.getParameter("cPath");
    String filename = request.getParameter("filename");
    
    String path = getServletContext().getRealPath("/member/"+cPath+"/"+filename);
    File file = new File(path);
    file.delete();
    String encoded_cPath = URLEncoder.encode(cPath, "utf-8");
    response.sendRedirect("mydisk.jsp?cPath="+encoded_cPath);
%>
