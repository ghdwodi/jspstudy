<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>동적 쿼리 결과</title>
	</head>
	<body>
		<c:choose>
			<c:when test="${idx==0}"><h1>사번 검색 결과</h1></c:when>
			<c:when test="${idx==1}"><h1>이름 검색 결과</h1></c:when>
			<c:when test="${idx==2}"><h1>직종 검색 결과</h1></c:when>
			<c:when test="${idx==3}"><h1>부서 검색 결과</h1></c:when>
		</c:choose>
		<h2>
			<ul>
				<c:choose>
					<c:when test="${empty k_list}">
						<li>내용이 없습니다.</li>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${k_list}" varStatus="vs">
							<li>${k.employee_id},${k.first_name},${k.job_id},${k.salary}</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</h2>
	</body>
</html>