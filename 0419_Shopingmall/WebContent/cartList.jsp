<%@page import="com.hb.myshopingmall.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.hb.myshopingmall.Cart"%>
<%@page import="javax.smartcardio.Card"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Cart cart = (Cart)session.getAttribute("cart");
	List<ProductVO> cartlist = cart.getCartlist();
	pageContext.setAttribute("cartlist", cartlist);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			table.cartlist_t{
				border: 1px solid navy;
				width : 60% ;
				border-collapse:collapse;
				font-size: 12pt;
				bordercolor : "navy";
				cellpadding:"4";
				cellspacing:"0";
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
		<div align="center">
			<table class="cartlist_t">
				<tr>
					<td colspan="6" class="button">
						<input type="button" value="돌아가기" 
						onclick="javascript:location.href='product_list.jsp'"/>
					</td>
				</tr>
				<tr>
					<td colspan="6">:: 장바구니 내용</td>
				</tr>
				<tr bgcolor="#dedede">
					<th>제품번호</th>
					<th width="25%">제품명</th>
					<th width="20%">단가</th>
					<th>수량</th>
					<th>금액</th>
					<th>삭제</th>
				</tr>
				<c:choose>
					<c:when test="${empty cartlist}">
						<tr align="center">
							<td colspan="6">
								<b>장바구니가 비었습니다.</b>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${cartlist}">
							<tr align="center">
								<td>${k.p_num}</td>
								<td>${k.p_name}</td>
								<td>
									정가: ${k.p_price}원<br />
									<font color="red">
									할인가: ${k.p_saleprice}원
									</font>
								</td>
								<td>
									<form action="editQuant.jsp" method="post">
										<input type="number" name="su" value="${k.quant}" width="20%" />
										<input type="hidden" name="p_num" value="${k.p_num}" />
										<input type="submit" value="수정" />
									</form>
								</td>
								<td>${k.totalprice}원</td>
								<td>
									<input type="button" value="삭제" 
									style="border:1 solid black;cursor:pointer" 
									onclick="javascript:location.href='delProduct.jsp?p_num=${k.p_num}'">
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="5" align="right">총 결제액 : <%=cart.getTotal()%>원</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="6" class="button">
						<input type="button" value="돌아가기" 
						onclick="javascript:location.href='product_list.jsp'"/>
					</td>
				</tr>
			</table>
		</div>
		<%}%>
	</body>
</html>