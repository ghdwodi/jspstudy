<%@page import="java.util.List"%>
<%@page import="com.hb.myshopingmall.DAO"%>
<%@page import="com.hb.myshopingmall.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String prod_num = request.getParameter("num");
	// ProductVO pvo = DAO.getOneList(prod_num);
	
	// 1. DB를 호출하지 않는 메소드를 사용할 수 있다.
	//    리스트째로 세션에 담아 사용할 수 있고, DAO 내에서 전역변수에 담아 사용할 수도 있다.
	ProductVO pvo = DAO.findProduct(prod_num);
	pageContext.setAttribute("pvo", pvo);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			table.p_content_t{
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
			<table class="p_content_t">
				<tr>
					<td colspan="2" align="center"><img src ="upload/product_photo/${pvo.p_num}/${pvo.p_image_l}"></td>
				</tr>
				<tr>
					<td width="40%" bgcolor="#dedede" style="font-weight: bold">제품Category</td>
					<td width="60%">${pvo.category}</td>
				</tr>
				<tr>
					<td width="40%" bgcolor="#dedede" style="font-weight: bold">제품번호</td>
					<td width="60%">${pvo.p_num}</td>
				</tr>
				<tr>
					<td width="40%" bgcolor="#dedede" style="font-weight: bold">제품이름</td>
					<td width="60%">${pvo.p_name}</td>
				</tr>
				<tr>
					<td width="40%" bgcolor="#dedede" style="font-weight: bold">제품판매사</td>
					<td width="60%">${pvo.p_company}</td>
				</tr>
				<tr>
					<td width="40%" bgcolor="#dedede" style="font-weight: bold">제품 시중가격</td>
					<td width="60%">${pvo.p_price}원
					<font color="red">(할인가: ${pvo.p_saleprice}원)</font></td>
				</tr>
				<tr>
					<td colspan="2" bgcolor="#dedede" style="font-weight: bold">제품설명</td>
				</tr>
				<tr>
					<td colspan="2">${pvo.p_content}</td>
				</tr>
				<tr>
					<td colspan="2" align="center" bgcolor="#dedede">
					<input type="button" value="장바구니에 담기" 
					onclick="javascript:location.href='addProduct.jsp?num=${pvo.num}&memberidx=${memberVO.memberidx}'"/>
					<input type="button" value="장바구니 보기" 
					onclick="javascript:location.href='cartList.jsp'"/>
					<input type="button" value="돌아가기" 
					onclick="javascript:location.href='product_list.jsp?category=${pvo.category}'"/>
					</td>
				</tr>    
			</table>
		</div>
		<%}%>
	</body>
</html>