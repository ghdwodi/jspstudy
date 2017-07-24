<%@page import="com.hb.myshopingmall.DAO"%>
<%@page import="com.hb.myshopingmall.ProductVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = getServletContext().getRealPath("/upload/product_photo/"+request.getParameter("p_num"));
	File file = new File(path);
	file.mkdirs();
	MultipartRequest mr = new MultipartRequest(
				request,
				path,
				500*1024*1024,
				"utf-8",
				new DefaultFileRenamePolicy()
			);
	ProductVO pvo = new ProductVO();
	pvo.setCategory(mr.getParameter("category"));
	pvo.setP_num(mr.getParameter("p_num"));
	pvo.setP_name(mr.getParameter("p_name"));
	pvo.setP_company(mr.getParameter("p_company"));
	pvo.setP_price(Integer.parseInt(mr.getParameter("p_price")));
	pvo.setP_saleprice(Integer.parseInt(mr.getParameter("p_saleprice")));
	pvo.setP_content(mr.getParameter("p_content"));
	
	if(mr.getFilesystemName("p_image_s") != null){
		pvo.setP_image_s(mr.getFilesystemName("p_image_s"));
	}else{
		pvo.setP_image_s("");
	}
	if(mr.getFilesystemName("p_image_l") != null){
		pvo.setP_image_l(mr.getFilesystemName("p_image_l"));
	}else{
		pvo.setP_image_l("");
	}
	
	int result = DAO.getEnroll(pvo);
	if(result>0){
		response.sendRedirect("enrollproduct.jsp");
	}else{%>
		<script type="text/javascript">
			alert("등록 실패");
			history.go(-1);
		</script>
	<%}
%>