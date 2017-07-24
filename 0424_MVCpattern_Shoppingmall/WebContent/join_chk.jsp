<%@page import="com.hb.myshopingmall.DAO"%>
<%@page import="com.hb.myshopingmall.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${res==success}">
		<script type="text/javascript">
			alert("가입 성공");
			location.href="Shop_Controller?cmd=login";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("가입 실패");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>