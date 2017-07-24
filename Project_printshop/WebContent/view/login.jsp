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
			function login_go2(f) {
				if(f.id.value==""){
					alert("아이디를 입력하세요");
					return;
				}
				if(f.pwd.value==""){
					alert("패스워드를 입력하세요");
					return;
				}
				$(function() {
					$.ajax({
						url:"/Project_printshop/Customer_cont?cmd=login",
						data:$("#login2").serialize(),
						type:"get",
						dataType:"text",
						success:function(data){
							if(data=="로그인 성공"){
								location.href="/Project_printshop/Page_cont?cmd=main";
							}else{
								alert(data);
								$("#id2").val("");
								$("#pwd2").val("");
							}
						},
						error:function(){
							alert("로그인 실패");
						}
					});
				});
			};
			function join_go2() {
				location.href="/Project_printshop/Page_cont?cmd=join";
			};
		</script>
		<style type="text/css">
			#loginfield_div{
				margin: auto;
				margin-top:20px;
				width: 30%;
				height: 400px;
			}
			.loginfield_btn{
				width: 100px;
				height: 30px;
				font-weight: bold;
				font-size: large;
			}
		</style>
	</head>
	<body>
		<jsp:include page="top.jsp"/>
		<form id="login2" method="post">
			<div id="loginfield_div">
				<fieldset>
					<div style="text-align: center;"><img src="img/images/img_login.png"></div>
					<table style="margin: auto;">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" id="id2"/></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" id="pwd2"/></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<input type="button" value="로그인" onclick="login_go2(this.form)" class="loginfield_btn"/>
								<input type="button" value="회원가입" onclick="join_go2()" class="loginfield_btn"/>
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
		</form>
	</body>
</html>