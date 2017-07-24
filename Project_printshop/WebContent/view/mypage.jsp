<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>한빛인쇄</title>
		<script type="text/javascript">
			function modify_go() {
				location.href="/Project_printshop/Page_cont?cmd=modify";
			}
			function loginpage_go(){
				alert("로그인하십시오");
				location.href="/Project_printshop/Page_cont?cmd=login";
			}
		</script>
		<style type="text/css">
		</style>
	</head>
	<c:choose>
		<c:when test="${loginchk==-1||empty loginchk}">
			<body onload="loginpage_go()"></body>
		</c:when>
		<c:otherwise>
			<body>
				<jsp:include page="top.jsp"/>
				<form id="join" method="post">
					<fieldset>
						<legend>회원정보</legend>
						아이디 : ${cvo.c_id}<br />
						성명 : ${cvo.c_name}<br />
						이메일 : 
						<c:choose>
							<c:when test="${cvo.c_email==null}">
								없음
							</c:when>
							<c:otherwise>
								${cvo.c_email}
							</c:otherwise>
						</c:choose>
						<br />
						우편번호 : ${cvo.c_addrnum}<br />
						주소 : ${cvo.c_addr1}, ${cvo.c_addr2}<br />
						<input type="button" value="회원정보 수정" id="modifybtn" onclick="modify_go()"/>
						<input type="button" value="주문내역" onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=orderlist'""/>
					</fieldset>
				</form>
			</body>
		</c:otherwise>
	</c:choose>
</html>