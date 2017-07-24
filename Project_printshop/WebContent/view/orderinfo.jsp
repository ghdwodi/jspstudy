<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>한빛인쇄</title>
		<script type="text/javascript">
			function loginpage_go(){
				alert("로그인하십시오");
				location.href="/Project_printshop/Page_cont?cmd=login";
			}
		</script>
	</head>
	<c:choose>
		<c:when test="${loginchk==-1||empty loginchk}">
			<body onload="loginpage_go()"></body>
		</c:when>
		<c:otherwise>
			<body>
				<jsp:include page="top.jsp"/>
				<form id="orderform" method="post" name="orderform">
					<input type="hidden" name="c_idx" value="${cvo.c_idx}"/>
					부수<input class="orders" type="number" value="1" name="copy_num"/><br />
					매수<input class="orders" type="number" value="1" name="page_num"/><br />
					용지<select class="orders" name="pf_idx" id="pf">
						<c:forEach var="k" items="${pfVo}" varStatus="pfvs">
							<option value="${k.pf_idx}">
							${k.paper_form} : ${k.pf_price}</option>
						</c:forEach>
					</select><br />
					인쇄<select class="orders" name="pt_idx" id="pt">
						<c:forEach var="k" items="${ptVo}">
							<option value="${k.pt_idx}">
							${k.printing} : ${k.pt_price}원</option>
						</c:forEach>
					</select><br />
					간지,속지<select class="orders" name="ip_idx" id="ip">
						<c:forEach var="k" items="${ipVo}">
							<option value="${k.ip_idx}">
							${k.inner_paper} : ${k.ip_price}원</option>
						</c:forEach>
					</select><br />
					간지,속지 매수<input class="orders" type="number" name="inner_paper_num" value="0"/><br />
					표지<select class="orders" name="cover_idx" id="cover">
						<c:forEach var="k" items="${coverVo}">
							<option value="${k.cover_idx}">
							${k.cover} : ${k.cover_price}원</option>
						</c:forEach>
					</select><br />
					제본<select class="orders" name="bind_idx" id="bind">
						<c:forEach var="k" items="${bindVo}">
							<option value="${k.bind_idx}">
							${k.bind} : ${k.bind_price}원</option>
						</c:forEach>
					</select><br />
					받는사람<input type="text" name="o_name" id="o_name"/><br />
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="addrnum"/>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/><br />
					<input type="text" id="sample6_address" placeholder="주소" name="addr1"/>
					<input type="text" id="sample6_address2" placeholder="상세주소" name="addr2"/>
					<input type="checkbox" id="addrcheckbox"/> 본인 정보로 보내기
					<br />
					특이사항<br /><textarea rows="10" cols="50"></textarea>
					<br />
					<input type="button" value="완료" id="calcbtn"/>
					<div id="orderdiv"></div>
				</form>
			</body>
		</c:otherwise>
	</c:choose>
</html>