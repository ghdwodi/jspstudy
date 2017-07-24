<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>한빛인쇄</title>
		<script type="text/javascript" src="/Project_printshop/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			function loginpage_go(){
				alert("로그인하십시오");
				location.href="/Project_printshop/Page_cont?cmd=login";
			}
			function info_go(data) {
				$.ajax({
					url:"/Project_printshop/Customer_cont?cmd=onelist",
					type:"get",
					data:"o_idx="+data,	// 서블릿에 넘어가는 데이터
					dataType:"text",
					success:function(data){
						$("#orderinform").html(data);
					},
					error:function(){
						alert("조회 실패");
					}
				});
			}
			function delete_go(data) {
				$.ajax({
					url:"/Project_printshop/Order_cont?cmd=del_order",
					type:"get",
					data:"o_idx="+data,	// 서블릿에 넘어가는 데이터
					dataType:"text",
					success:function(){
						location.href="/Project_printshop/Page_cont?cmd=orderlist";
					},
					error:function(){
						alert("삭제 실패");
					}
				});
			}
		</script>
		<style type="text/css">
			.o_table{
				text-align :center;
				border: 1px solid black;
				width : 40%;
			}
			td,th{
				border: 1px solid black;
				margin: auto;
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
				<h3>상세 주문내역</h3>
				<div id="orderinform"></div>
				<hr />
				<h3>주문내역</h3>
				<table class="o_table">
					<thead>
						<tr><th>주문번호</th><th>주문일자</th><th>삭제</th></tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty ovoList}">
								<tr>
									<td colspan="3"><h3>정보가 없습니다.</h3></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${ovoList}">
									<tr>
										<td><a class="orderinfo" onclick="info_go(${k.o_idx})" href="#">${k.o_idx}</a></td>
										<td>${k.orderdate.substring(0,10)}</td>
										<td><input type="button" value="삭제" onclick="delete_go(${k.o_idx})" /></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</body>
		</c:otherwise>
	</c:choose>
</html>