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
			function write_go(f) {
				if(f.title.value==""){
					alert("제목을 입력하세요");
					return;
				}
				if(f.content.value==""){
					alert("내용을 입력하세요");
					return;
				}
				$.ajax({
					url:"/Project_printshop/BBS_cont?cmd=write",
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
			function rewrite_go(f) {
				if(f.title.value==""){
					alert("제목을 입력하세요");
					return;
				}
				if(f.content.value==""){
					alert("내용을 입력하세요");
					return;
				}
				$.ajax({
					url:"/Project_printshop/BBS_cont?cmd=reply",
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
			    background-color: #b3b3b3;
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
				<c:choose>
					<c:when test="${reply==1}">
						<h3>${c_name}님에게 답변</h3>
					</c:when>
					<c:otherwise>
						<h3>글쓰기</h3>
					</c:otherwise>
				</c:choose>
				<form id="writeform" method="post">
					<table style="width: 500px">
						<tr>
							<th bgcolor="#b3b3b3">작성자</th>
							<td>${cvo.c_name}
							<input type="hidden" name="c_idx" value="${cvo.c_idx}"/></td>
						</tr>
						<tr>
							<th bgcolor="#b3b3b3">제목</th>
							<td><input type="text" name="title"/></td>
						</tr>
						<tr>
							<th bgcolor="#b3b3b3" colspan="3">내용</th>
						</tr>
						<tr>
							<td colspan="3" align="left">
								<textarea rows="10" cols="60" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="hidden" name="groups" value="${bvo.groups}" />
								<input type="hidden" name="step" value="${bvo.step}" />
								<input type="hidden" name="lev" value="${bvo.lev}" />
								<input type="hidden" name="b_category" value="${b_category}" />
								<c:choose>
									<c:when test="${reply==1}">
										<input type="button" value="답변" onclick="rewrite_go(this.form)"/>
										<input type="button" value="돌아가기"
										 onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=bbsview&b_idx=${bvo.b_idx}&cPage=${cPage}'"/>
									</c:when>
									<c:otherwise>
										<input type="button" value="작성" onclick="write_go(this.form)"/>
										<input type="button" value="목록"
										 onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=bbs&b_category=${b_category}&cPage=${cPage}'"/>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</form>
			</body>
		</c:otherwise>
	</c:choose>
</html>