<%@page import="com.hb.mybbs.BBS_VO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BBS_VO bvo = (BBS_VO)session.getAttribute("bvo");
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
				} else if(f.pwd.value!="<%=bvo.getPwd()%>"){
					alert("비밀번호가 맞지 않습니다.");
					f.pwd.value="";
					f.pwd.focus();
					return;
				}
				var r = confirm("정말로 삭제하시겠습니까?");
				if (!r) {
					return;
				}
				f.action="del_ok.jsp";
				f.submit();
			}
			function list_go() {
				location.href="list.jsp";
			}
		</script>
	</head>
	<body>
		<div align="center">
			<h2>삭제화면</h2>
			<hr />
			<form method="post">
				<table width="500" cellpadding="5" cellspacing="0" border="1">
					<tr align="center">
						<td bgcolor="#99ccff">비밀번호</td>
						<td>
						<input type="password" name="pwd" size ="20"/>
						<input type="hidden" name="b_idx" value="<%=bvo.getB_idx()%>" /></td>
					</tr>
					<tfoot>
						<tr align="center">
							<td colspan="2">
								<input type="button" value="삭제" onclick="delete_go(this.form)" />
								<input type="button" value="취소" onclick="list_go()" />
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</body>
</html>