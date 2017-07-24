<%@page import="com.hb.myshopingmall.MemberVO"%>
<%@page import="com.hb.myshopingmall.DAO"%>
<%@page import="com.hb.myshopingmall.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- useBean의 장점은 객체 생성과 세션 저장을 한큐에 할 수 있다는 점이다. -->
<jsp:useBean id="cart" class="com.hb.myshopingmall.Cart" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	String category = request.getParameter("category");
	if(category==null) category = "ele002";
	List<ProductVO> plist = DAO.getList(category);
	session.setAttribute("plist", plist);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			table.p_list_table{
				border: 1px solid navy;
				width: 70%;
		 		font-size: 15pt;
		 		cellpadding: 4;
		 		cellspacing: 0;
		 		border-collapse: collapse;
			}
			td,th{
				border: 1px solid navy;
				text-align: center;
			}
			td.button{
				text-align: right;
			}
		</style>
	</head>
	<body>
		<%int chk = -1;
		if(session.getAttribute("login_chk")!=null){
			chk = (int)session.getAttribute("login_chk");
		}
		if(chk==-1){%>
			<script type="text/javascript">
				alert("로그인을 하십시오.");
				location.href="login.jsp";
			</script>
		<%}else{%>
		<p><jsp:include page="shop.jsp"/></p>
		<div align="center">
			<table class="p_list_table">
				<tr>
					<td colspan="5" class="button">
						<input type="button" value="돌아가기"
						onclick="javascript:location.href='memberpage.jsp?memberidx=${memberVO.memberidx}&name=${memberVO.name}'"/>
						<input type="button" value="장바구니 보기"
						onclick="javascript:location.href='cartList.jsp'"/>
					</td>
				</tr>
			    <tr bgcolor="#dedede">
			        <th width="10%">제품번호</th>
			        <th width="10%">이미지</th>
			        <th width="35%">제품명</th>
			        <th width="20%">제품가격</th>
			        <th width="25%">비고</th>
			    </tr>
			    <c:choose>
			    	<c:when test="${empty plist}">
			    		<tr><td colspan="5"><h2>등록된 제품이 없습니다.</h2></td></tr>
			    	</c:when>
			    	<c:otherwise>
			    		<c:forEach var="k" items="${plist}">
			    			<tr align="center">
								<td>${k.p_num}</td>
								<td>
									<img src="upload/product_photo/${k.p_num}/${k.p_image_s}" width="100" height="95">
								</td>
								<td>
									<a href="product_content.jsp?num=${k.num}">
									${k.p_name}</a>
								</td>
								<td>
									${k.p_saleprice}원<br />
									<font color="red">(${k.percent}%)</font>
								</td>
								<td>
									시중가<br />${k.p_price}원
								</td>
							</tr>
			    		</c:forEach>
			    	</c:otherwise>
			    </c:choose>
			    <tr>
					<td colspan="5" class="button">
						<input type="button" value="장바구니 보기"
						onclick="javascript:location.href='cartList.jsp'"/>
					</td>
				</tr>
			</table>
		</div>
		<%}%>
	</body>
</html>