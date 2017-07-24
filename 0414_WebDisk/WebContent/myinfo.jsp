<%@page import="com.hb.mywebdisk.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 정보</title>
		<style type="text/css">
			table{
				border-collapse:collapse;
				width: 300px;
				text-align: center;
			}
			table,tr,td{border: 1px solid black;}
		</style>
	</head>
	<body>
	<%
		Boolean chk = false;
		chk = (Boolean)session.getAttribute("login_chk");
		if(chk==null){%>
			<script type="text/javascript">
				alert("로그인을 하십시오.");
				location.href="index.jsp";
			</script>
		<%}else{
			VO mvo =(VO)session.getAttribute("loginVO");
		%>
			<div align="center">
			<h2>나의 정보 보기</h2>
			<table>
				<tbody>
					<tr>
						<td bgcolor="#99ccff">회원번호</td>
						<td><%=mvo.getIdx() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">ID</td>
						<td><%=mvo.getId() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">비밀번호</td>
						<td><%=mvo.getPwd() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">이름</td>
						<td><%=mvo.getName() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">나이</td>
						<td><%=mvo.getAge() %></td>
					</tr>
					<tr>
						<td bgcolor="#99ccff">주소</td>
						<td><%=mvo.getAddr() %></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<a href="mydisk.jsp">내 디스크 가기</a>
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
		<%
		}
	%>
		
	</body>
</html>