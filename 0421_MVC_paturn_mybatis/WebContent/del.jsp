<%@page import="com.hb.myguestbook.VO"%>
<%@page import="com.hb.myguestbook.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function delete_go(f) {
				if(f.pwd.value==""){
					alert("비밀번호를 입력하십시오.");
					f.pwd.focus();
					return;
				} else if(f.pwd.value!=${vo.pwd}){
					alert("비밀번호가 맞지 않습니다.");
					f.pwd.value="";
					f.pwd.focus();
					return;
				}
				var r = confirm("정말로 삭제하시겠습니까?");
				if (!r) {
					return;
				}
				f.action="/0421_MVC_paturn_mybatis/GuestbookCon?cmd=delete";
				f.submit();
			}
		</script>
	</head>
	<body>
		<div align="center">
			<h2>방명록 : 삭제화면</h2>
			<hr />
			<p>[<a href="/0421_MVC_paturn_mybatis/GuestbookCon?cmd=list">목록으로 이동</a>]</p>
			<form method="post">
				<table width="500" cellpadding="5" cellspacing="0" border="1">
					<tr align="center">
						<td bgcolor="#99ccff">비밀번호</td>
						<td>
						<input type="password" name="pwd" size ="20"/>
						<input type="hidden" name="idx" value="${vo.idx}" /></td>
					</tr>
					<tfoot>
						<tr align="center">
							<td colspan="2">
								<input type="button" value="삭제" onclick="delete_go(this.form)" />
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</body>
</html>