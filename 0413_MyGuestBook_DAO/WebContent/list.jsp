<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="com.hb.myguestbook.VO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<VO> list = DAO.getList();%>
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
					<%if(list.size()>0){%>
						<%
						for(VO k:list){%>
							<tr align="center">
								<td><%=k.getIdx()%></td>
								<td><%=k.getName()%></td>
								<td><a href="onelist.jsp?idx=<%=k.getIdx()%>" ><%=k.getSubject()%></a></td>
								<td><%=k.getRegdate().substring(0, 16)%></td>
							</tr>
						<%}
						%>
					<%}else{%>
						<tr align="center">
							<td colspan="4"><h2>해당 자료가 존재하지 않습니다.</h2></td>
						</tr>
					<%}%>
				</tbody>
			</table>
		</div>
	</body>
</html>