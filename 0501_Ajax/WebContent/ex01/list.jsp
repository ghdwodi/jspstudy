<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript"></script>
		<style type="text/css">
			h2{text-align: center;}
			table{width: 70%}
			table,tr,td,th{
				text-align: center;
				border: 1px solid red;
				margin: auto;
			}
		</style>
	</head>
	<body>
		<jsp:include page="index.jsp"/>
		<hr/>
		<h2>개인자료목록</h2>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>나이</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="6"><h2>자료없음</h2></td>
						</tr>
					</c:when>
					<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${k.id}</td>
							<td>${k.pwd}</td>
							<td>${k.name}</td>
							<td>${k.age}</td>
							<td>${k.addr}</td>
						</tr>
					</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</body>
</html>