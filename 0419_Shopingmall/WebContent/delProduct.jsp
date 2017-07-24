<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="com.hb.myshopingmall.Cart" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String p_num = request.getParameter("p_num");
	cart.deleteProduct(p_num);
	response.sendRedirect("cartList.jsp");
%>