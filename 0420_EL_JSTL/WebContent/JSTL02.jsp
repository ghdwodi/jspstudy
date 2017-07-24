<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <p>여기는 JSTL02.jsp</p>
	<p>이름 : ${param.name}</p>
	<p>직업 : ${param.job}</p>
	<hr /> --%>
	<c:set var="k" value="${7/3}"/>
	<c:set var="l" value="${12345.6789}"/>
	${k}<br />
	<p><fmt:formatNumber value="${k}" pattern="#,##0"/></p>
	<p><fmt:formatNumber value="${k}" pattern="#,##0.0"/></p>
	<p><fmt:formatNumber value="${k}" pattern="#,##0.00"/></p>
	<hr />
	<p><fmt:formatNumber value="${l}" pattern="#,##0"/></p>
	<p><fmt:formatNumber value="${l}" pattern="#,##0.0"/></p>
	<p><fmt:formatNumber value="${l}" pattern="#,##0.00"/></p>
	<p><fmt:formatNumber value="${l}" pattern="##,##0.000"/></p>
	<p><fmt:formatNumber value="${l}" pattern="###,##0.0000"/></p>
	<p><fmt:formatNumber value="${l}" pattern="#,###,##0.00000"/></p>
	<p><fmt:formatNumber value="${l}" pattern="00,000.000"/></p>
	<p><fmt:formatNumber value="${l}" pattern="000,000.0000"/></p>
	<p><fmt:formatNumber value="${l}" pattern="0,000,000.00000"/></p>
	<hr />
	<% Date now = new Date(); %>
	<%=now %>
	<%pageContext.setAttribute("now", now); %>
	${now}
	<hr />
	<fmt:formatDate value="${now}"/><br />
	<fmt:formatDate value="${now}" dateStyle="short"/><br />
	<fmt:formatDate value="${now}" dateStyle="medium"/><br />
	<fmt:formatDate value="${now}" dateStyle="long"/><br />
	<fmt:formatDate value="${now}" dateStyle="full"/>
	<hr />
	<fmt:formatDate type="time" value="${now}"/><br />
	<fmt:formatDate type="time" value="${now}" timeStyle="short"/><br />
	<fmt:formatDate type="time" value="${now}" timeStyle="medium"/><br />
	<fmt:formatDate type="time" value="${now}" timeStyle="long"/><br />
	<fmt:formatDate type="time" value="${now}" timeStyle="full"/>
	<hr />
	<fmt:formatDate type="both" value="${now}" dateStyle="short" timeStyle="short"/><br />
	<fmt:formatDate type="both" value="${now}" dateStyle="medium" timeStyle="medium"/><br />
	<fmt:formatDate type="both" value="${now}" dateStyle="long" timeStyle="long"/><br />
	<fmt:formatDate type="both" value="${now}" dateStyle="full" timeStyle="full"/><br />
</body>
</html>