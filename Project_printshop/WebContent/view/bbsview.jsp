<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			tr {
			    text-align:center;
			    padding:4px 10px;
			    background-color: #F6F6F6;
			}
				
			th {
				width:120px;
			    text-align:center;
			    padding:4px 10px;
			    background-color: #b3b3b3;
			}
		</style>
		<script type="text/javascript" src="/Project_printshop/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#delbtn").click(function() {
					var del_ok = confirm("정말로 삭제하시겠습니까?");
					if(del_ok==true){
						$.ajax({
							url:"/Project_printshop/BBS_cont?cmd=bbsdelete",
							type:"get",
							data:"b_idx=${bvo.b_idx}",	// 서블릿에 넘어가는 데이터
							dataType:"text",
							success:function(data){
								location.href="/Project_printshop/Page_cont?cmd=bbs&b_category=${b_category}";
							},
							error:function(){
								alert("삭제 실패");
							}
						});
					}else{
						return;
					}
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="top.jsp"/>
		<h3>열람</h3>
		<form name="viewform" action="rewrite.jsp" method="post">
			<table style="width: 500px">
				<c:set var="c_idx2" value="${bvo.c_idx}"/>
				<tr>
					<%
						String c_idx = (String)pageContext.getAttribute("c_idx2");
						session.setAttribute("c_name", DAO.getWriter(c_idx));
					%>
					<th bgcolor="#b3b3b3">작성자</th>
					<td>${c_name}</td>
				</tr>
				<tr>
					<th bgcolor="#b3b3b3">제목</th>
					<td>${bvo.title}</td>
				</tr>
				<tr>
					<th bgcolor="#b3b3b3" colspan="3">내용</th>
				</tr>
				<tr>
					<td colspan="3" align="left"><pre>${bvo.content}</pre></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="hidden" name="b_idx" value="${bvo.b_idx}" />
						<input type="button" value="답변"
						 onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=reply'"/>
						<c:choose>
							<c:when test="${bvo.c_idx==cvo.c_idx||cvo.c_idx==0}">
								<input type="button" value="수정"
								 onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=bbsmodify'"/>
								<input type="button" value="삭제" id="delbtn"/>
							</c:when>
						</c:choose>
						<input type="button" value="목록"
						 onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=bbs&b_category=${b_category}&cPage=${cPage}'"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>