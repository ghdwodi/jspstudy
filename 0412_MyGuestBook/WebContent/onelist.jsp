<%@page import="com.hb.myguestbook.VO"%>
<%@page import="com.hb.myguestbook.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SqlSession ss = DBService.getFactory().openSession();
	VO vo = ss.selectOne("onelist", request.getParameter("idx"));
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function update_go(f) {
				f.action="update.jsp";
				f.submit();
			}
			function delete_go(f) {
				f.action="del.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
	
		
		<div align="center">
			<h2>방명록 : 내용화면</h2>
			<hr />
			<p>[<a href="list.jsp">목록으로 이동</a>]</p>
			<form method="post">
				<table width="500" cellpadding="5" cellspacing="0" border="1">
					<tr align="center">
						<td bgcolor="#99ccff">작성자</td>
						<td>
						<input type="hidden" name="idx" value="<%=vo.getIdx()%>" />
						<%=vo.getName()%></td>
					</tr>
					<tr align="center">
						<td bgcolor="#99ccff">제  목</td>
						<td><%=vo.getSubject()%></td>
					</tr>
					<tr align="center">
						<td bgcolor="#99ccff">email</td>
						<td><%=vo.getEmail()%></td>
					</tr>
					<tr>
						<td colspan="2"><pre><%=vo.getContent()%></pre></td>
					</tr>
					<tfoot>
						<tr align="center">
							<td colspan="2">
								<input type="button" value="수정" onclick="update_go(this.form)" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="삭제" onclick="delete_go(this.form)" />
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</body>
</html>