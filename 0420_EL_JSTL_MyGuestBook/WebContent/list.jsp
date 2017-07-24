<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="com.hb.myguestbook.VO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%List<VO> list = DAO.getList();%>
<%pageContext.setAttribute("list", list); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div align="center">
			<h2>방명록</h2>
			<hr />
			<p>[<a href="write.jsp">방명록 쓰기</a>]</p>
			<table width="500" cellpadding="5" cellspacing="0" border="1">
				<thead>
					<tr align="center">
						<td bgcolor="#99ccff">번호</td>
						<td bgcolor="#99ccff">작성자</td>
						<td bgcolor="#99ccff">제목</td>
						<td bgcolor="#99ccff">작성일시</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr align="center">
								<td colspan="4"><h2>해당 자료가 존재하지 않습니다.</h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}" varStatus="vs">
								<tr align="center">
									<td>${vs.count}</td>
									<td>${k.name}</td>
									<td><a href="onelist.jsp?idx=${k.idx}" >${k.subject}</a></td>
									<td>${k.regdate.substring(0, 16)}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</body>
</html>