<%@page import="com.hb.myshopingmall.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String memberidx = request.getParameter("memberidx");
	Cart cart = (Cart)session.getAttribute("cart");
	cart.addProduct(num);
%>
<script type="text/javascript">
	alert("장바구니에 추가했습니다.");
	history.go(-1);
</script>