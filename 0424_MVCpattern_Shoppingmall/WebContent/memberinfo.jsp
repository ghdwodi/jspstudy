<%@page import="com.hb.myshopingmall.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function send_go() {
				if(joinform.name.value==""){
					alert("이름을 입력하세요.");
					joinform.name.focus();
					return;
				}
				if(joinform.age.value==""){
					alert("나이를 입력하세요.");
					joinform.age.focus();
					return;
				}
				if(joinform.gender.value==""){
					alert("성별을 입력하세요.");
					joinform.gender.focus();
					return;
				}
				joinform.action="Shop_Controller?cmd=info&photo2=${mvo.id}";
				joinform.submit();
			}
		</script>
	</head>
	<body>
		<form name="joinform" method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<th colspan="3"><h1>회원정보 수정 페이지</h1></th>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${mvo.id}
						<input type="hidden" name="memberidx" value="${mvo.memberidx}"></td>
						<td rowspan="6">
							<img alt="사진없음" src="upload/member/${mvo.id}/${mvo.photo}" height="200">
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" value="${mvo.name}"/></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="number" name="age" value="${mvo.age}"/></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<c:choose>
								<c:when test="${mvo.gender=='남성'}">
									남성<input type="radio" value="남성" name="gender" checked="checked"/>
									여성<input type="radio" value="여성" name="gender"/>
								</c:when>
								<c:otherwise>
									남성<input type="radio" value="남성" name="gender"/>
									여성<input type="radio" value="여성" name="gender" checked="checked"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>사진</td>
						<td>
							<input type="file" name="photo2"/>
							<input type="hidden" name="photo" value="${mvo.photo}"/>
						</td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email" value="${mvo.email}"/></td>
					</tr>
					<tr>
						<td><input type="button" value="정보수정" onclick="send_go()"></td>
						<td><input type="reset" name="초기화"/></td>
						<td><input type="button" value="돌아가기"
							onclick="javascript:location.href='Shop_Controller?cmd=login&chk=logined'"/></td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>