<%@page import="com.hb.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="/Project_printshop/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			function modify_go(f) {
				if(f.title.value==""){
					alert("제목을 입력하세요");
					return;
				}
				if(f.content.value==""){
					alert("내용을 입력하세요");
					return;
				}
				$.ajax({
					url:"/Project_printshop/BBS_cont?cmd=bbsmodify",
					type:"get",
					data:$("#writeform").serialize(),	// 서블릿에 넘어가는 데이터
					dataType:"text",
					success:function(data){
						location.href="/Project_printshop/Page_cont?cmd=bbs&b_category=${b_category}";
					},
					error:function(){
						alert("작성 실패");
					}
				});
			}
			function loginpage_go(){
				alert("로그인하십시오");
				location.href="/Project_printshop/Page_cont?cmd=login";
			}
		</script>
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
			    background-color: #B2CCFF;
			}
		</style>
	</head>
	<c:choose>
		<c:when test="${loginchk==-1||empty loginchk}">
			<body onload="loginpage_go()"></body>
		</c:when>
		<c:otherwise>
			<body>
				<jsp:include page="top.jsp"/>
				<form id="writeform" method="post">
					<table style="width: 500px">
						<tr>
							<th bgcolor="#B2EBF4">작성자
								<input type="hidden" name="b_idx" value="${bvo.b_idx}"/>
							</th>
							<td>${cvo.c_name}</td>
						</tr>
						<tr>
							<th bgcolor="#B2EBF4">제목</th>
							<td><input type="text" name="title" value="${bvo.title}"/></td>
						</tr>
						<tr>
							<th bgcolor="#B2EBF4" colspan="3">내용</th>
						</tr>
						<tr>
							<td colspan="3" align="left">
								<textarea rows="10" cols="60" name="content">${bvo.content}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="button" value="수정" onclick="modify_go(this.form)"/>
								<input type="button" value="목록"
								 onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=bbs&b_category=${b_category}&cPage=${cPage}'"/>
							</td>
						</tr>
					</table>
				</form>
			</body>
		</c:otherwise>
	</c:choose>
</html>