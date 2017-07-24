<%@page import="com.hb.myguestbook.DAO"%>
<%@page import="com.hb.myguestbook.VO"%>
<%@page import="com.hb.myguestbook.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	VO vo = DAO.getSelectOne(request.getParameter("idx"));
	
	// 수정과 삭제를 위해 vo를 세션에 저장한다.
	session.setAttribute("vo", vo);
	
	String filename = vo.getFilename();
	if(vo.getFilename()==null){
		filename = "첨부파일 없음";
	}
	
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
					<tr align="center">
						<td bgcolor="#99ccff">첨부파일</td>
						<%if(vo.getFilename()==null){%>
							<td>첨부파일 없음</td>
						<%}else{%>
							<td><a href="filedownload.jsp?filename=<%=vo.getFilename()%>"><%=vo.getFilename()%></a></td>
						<%}%>
						
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