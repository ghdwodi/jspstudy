<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결과</title>
	</head>
	<body>
		<h1>결과 보기</h1>
		<ul>
			<li><h2>이름 : ${sessionScope.name}</h2></li>
			<li><h2>총점 : ${sessionScope.sum}</h2></li>
			<li><h2>평균 : <fmt:formatNumber value="${sessionScope.avg}" pattern=".0"/></h2></li>
			<li><h2>학점 : ${sessionScope.hak}</h2></li>
		</ul>
		<hr />
		<ul>
			<li><h2>이름 : ${vo.name}</h2></li>
			<li><h2>총점 : ${vo.sum}</h2></li>
			<li><h2>평균 : <fmt:formatNumber value="${vo.avg}" pattern=".0"/></h2></li>
			<li><h2>학점 : ${vo.hak}</h2></li>
		</ul>
		<hr />
		<ul>
			<li><h2>이름 : ${map.name}</h2></li>
			<li><h2>총점 : ${map.sum}</h2></li>
			<li><h2>평균 : <fmt:formatNumber value="${map.avg}" pattern=".0"/></h2></li>
			<li><h2>학점 : ${map.hak}</h2></li>
		</ul>
		<hr />
		<ul>
			<li><h2>이름 : ${map2.name}</h2></li>
			<li><h2>총점 : ${map2.sum}</h2></li>
			<li><h2>평균 : <fmt:formatNumber value="${map2.avg}" pattern=".0"/></h2></li>
			<li><h2>학점 : ${map2.hak}</h2></li>
		</ul>
		<hr />
		<ul>
			<c:forEach var="k" items="${map}">
				<li><h2>${k.key} : ${k.value}</h2></li>
			</c:forEach>
		</ul>
	</body>
</html>