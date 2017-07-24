<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="com.hb.myshopingmall.Cart" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	int su = Integer.parseInt(request.getParameter("su"));
	String p_num = request.getParameter("p_num");
	cart.changeQuant(p_num, su);
	response.sendRedirect("cartList.jsp");
%>