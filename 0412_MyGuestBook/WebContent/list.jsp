<%@page import="com.hb.myguestbook.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.hb.myguestbook.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		// 1. SplSession 만들기
		SqlSession ss = DBService.getFactory().openSession();
		// openSession() <= select문에 사용
		// openSession(true) <= 자동 커밋
		// openSession(false) <= 수동 커밋. 나중에라도 반드시 사용자가 직접 커밋을 해야 한다. 
		// true, false는 select를 포함한 모든 쿼리에 사용가능.
		// 트랜잭션을 하는 경우 수동 커밋을 해야 한다.
		
		// select는 4가지 종류를 사용한다.
		// 1. selectList(mapper의 id) : 결과가 여러 개 나올 때 사용
		// 2. selectList(mapper의 id, 파라미터) : 결과가  여러 개 나올 때 사용
		// 3. selectOne(mapper의 id) : 결과가 하나 나올 때 사용
		// 4. selectOne(mapper의 id, 파라미터) : 결과가 하나 나올 때 사용
		// ※ 파라미터는 반드시 하나만 가능하다. 여러개일때는 VO 또는 Map형식으로 객체를 만들어 사용한다.
		
		List<VO> list = ss.selectList("list");
	%>
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
					<%}
					ss.close(); %>
				</tbody>
			</table>
		</div>
	</body>
</html>