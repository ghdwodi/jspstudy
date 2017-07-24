<%@page import="com.hb.mybatis.VO"%>
<%@page import="com.hb.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색</title>
		<style type="text/css">
			div{
				align: left;
				text-align: center;
			}
			table,th,td {
				border: 1px solid black;
				align: center;
			}
			table{
				align: center;
				width: 600px;
			}
		</style>
		<script type="text/javascript">
			function update_go(f) {
				if(f.name.value==""){
					alert("이름을 입력하십시오.")
					return;
				}
				f.action="update.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
	<%@ include file="index.jsp" %>
	<br />	<br />
	<hr />
	
	<%
		SqlSession ss = DBService.getFactory().openSession();
		VO vo = ss.selectOne("onelist", request.getParameter("id"));
	%>
	<div>
		<h2>회원 검색 결과 보기</h2>
			<form>
				<table>
					<thead>
						<tr>
							<th colspan="2">회원 정보</th>
						</tr>
					</thead>
					<tbody>
						<%if(vo != null){%>
							<tr>
								<td>아이디</td>
								<td><%= vo.getId() %>
								<input type="hidden" name="id" value="<%= vo.getId() %>" />
								<input type="hidden" name="pwd" value="<%= vo.getPwd() %>" /></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" value="<%= vo.getName() %>" /></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input type="number" name="age" value="<%= vo.getAge() %>" /></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="addr" value="<%= vo.getAddr() %>" /></td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" value="갱신" onclick="update_go(this.form)" /></td>
							</tr>
						<%}else{ %> 
					 	<h2> 자료 없음 </h2>
						<%}%>
					</tbody>
				</table>
			</form>
		</div>
	</body>
</html>