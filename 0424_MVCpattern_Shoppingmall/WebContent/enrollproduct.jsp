<%@page import="com.hb.myshopingmall.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send_go() {
				for (var i = 0; i < enrollform.elements.length; i++) {
					if (enrollform.elements[i].value == "") {
						if (i==8 || i==9) continue;
						alert(enrollform.elements[i].name + "를 입력하세요");
						enrollform.elements[i].focus();
						return;//수행 중단
					}
				}
				enrollform.action="Shop_Controller?cmd=enroll&chk=go&p_num="+enrollform.p_num.value;
				enrollform.submit();
			}
		</script>
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
		<%}else if(chk!=0){%>
			<script type="text/javascript">
				alert("관리자가 아닙니다.");
				location.href="login.jsp";
			</script>
		<%}else{%>
		<form name="enrollform" method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<th colspan="2"><h1>물품등록(관리자모드)</h1></th>
					</tr>
					<tr>
						<td>분류</td>
						<td>
							<input type="radio" value="com001" name="category"/>컴퓨터
							<input type="radio" value="ele002" name="category"/>가전제품
							<input type="radio" value="sp003" name="category"/>스포츠
						</td>
					</tr>
					<tr>
						<td>상품번호</td>
						<td><input type="text" name="p_num"/></td>
					</tr>
					<tr>
						<td>제품명</td>
						<td><input type="text" name="p_name"/></td>
					</tr>
					<tr>
						<td>판매사</td>
						<td><input type="text" name="p_company"/></td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><input type="number" name="p_price"/></td>
					</tr>
					<tr>
						<td>할인가</td>
						<td><input type="number" name="p_saleprice"/></td>
					</tr>
					<tr>
						<td>상품이미지s</td>
						<td>
							<input type="file" name="p_image_s"/>
						</td>
					</tr>
					<tr>
						<td>상품이미지L</td>
						<td>
							<input type="file" name="p_image_l"/>
						</td>
					</tr>
					<tr>
						<td>상품 내용</td>
						<td><textarea rows="10" cols="50" name="p_content"></textarea></td>
					</tr>
					<tr>
						<td><input type="button" value="상품 등록" onclick="send_go()"></td>
						<td><input type="button" value="돌아가기"
						onclick="javascript:location.href='Shop_Controller?cmd=login&chk=logined'"/></td>
					</tr>
				</tbody>
			</table>
		</form>
		<%}%>
	</body>
</html>