<%@page import="com.hb.mybatis.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원목록</title>
	</head>
	<body>
		<jsp:include page="index.jsp" />
		<br /><br />
		<hr />
		<%-- MyBatis를 활용한 DB처리 --%>
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
		<div>
			<h1>전체 보기</h1>
			<%if(list.size()>0){%>
				<h2>
					<ul>
						<%
						for(VO k:list){%>
							<li><%= k.getIdx() %>&nbsp;&nbsp;
							<%= k.getId() %>&nbsp;&nbsp;
							<%= k.getPwd() %>&nbsp;&nbsp;
							<%= k.getName() %>&nbsp;&nbsp;
							<%= k.getAge() %>&nbsp;&nbsp;
							<%= k.getAddr() %></li>
						<%}
						%>
					</ul>
				</h2>
			<%}else{%>
				<h2>자료 없음</h2>
			<%}
			ss.close(); %>
		</div>
	</body>
</html>