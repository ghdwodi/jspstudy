<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>한빛인쇄</title>
		<style type="text/css">
			#menubar {
				list-style-type: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
				background-color: #333333;
			}
			
			#menubar > li{
				float: left;
			}
			#menubar > li > a {
				display: block;
				color: white;
				text-align: center;
				padding: 16px;
				text-decoration: none;
			}
			#menubar > li > a:hover {
				background-color: #111111;
				font-weight: bold;
			}
			h1{
				font-family: "궁서";
			}
			.bbsmenu {
				position : absolute;
				list-style-type: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
				background-color: #333333;
				display: none;
			}
			.bbsmenu > li{
				float: none;
			}
			.bbsmenu > li > a{
				display: block;
				color: white;
				text-align: center;
				padding: 16px;
				text-decoration: none;
			}
			.bbsmenu > li > a:hover {
				background-color: #111111;
				font-weight: bold;
			}
			#login{
				float: right;
			}
			#logined{
				float: right;
			}
			div{
				box-sizing: border-box;
			}
		</style>
		<script type="text/javascript" src="/Project_printshop/js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			function login_go(f) {
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
						data:$("#login").serialize(),
						type:"get",
						dataType:"text",
						success:function(data){
							if(data=="로그인 성공"){
								location.href="/Project_printshop/Page_cont?cmd=main";
							}else{
								alert(data);
								$("#id1").val("");
								$("#pwd1").val("");
							}
						},
						error:function(){
							alert("로그인 실패");
							$("#id1").val("");
							$("#pwd1").val("");
						}
					});
				});
			};
			$(function() {
				$("#bbs_go").hover(function(){
		            $(".bbsmenu").slideDown();
		            },function() {
		            	 $(".bbsmenu").slideUp();
					});
			})
			function joinpage_go() {
				location.href="/Project_printshop/Page_cont?cmd=join";
			};
			function mypage_go() {
				location.href="/Project_printshop/Page_cont?cmd=mypage";
			}
		</script>
	</head>
	<body>
		<div>
			<div>
				<c:choose>
					<c:when test="${loginchk==-1||empty loginchk}">
						<form id="login" method="post" name="loginform">
							아이디 : <input type="text" name="id" id="id1" size="7"/>
							비밀번호 : <input type="password" name="pwd" id="pwd1" size="7"/>
							<input type="button" value="로그인" onclick="login_go(this.form)"/>
							<input type="button" value="회원가입" onclick="joinpage_go()"/>
						</form>
					</c:when>
					<c:otherwise>
						<div id="logined">
							${cvo.c_name}님 환영합니다.
							<input type="button" value="주문내역" onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=orderlist'"/>
							<input type="button" value="마이페이지" onclick="mypage_go()"/>
							<input type="button" value="로그아웃" onclick="javascript:location.href='/Project_printshop/Page_cont?cmd=logout'"/>
						</div>
					</c:otherwise>
				</c:choose>
				<a href="/Project_printshop/Page_cont?cmd=main">
					<img src="/Project_printshop/img/타이틀.png" width="300px"/>
				</a>
			</div>
			<hr/>
			<div style="position:relative; z-index: 2">
				<ul id="menubar">
					<li><a href="/Project_printshop/Page_cont?cmd=intro">회사소개</a></li>
					<li><a href="/Project_printshop/Page_cont?cmd=orderguide">주문안내</a></li>
					<li><a href="/Project_printshop/Page_cont?cmd=orderpage">주문</a></li>
					<li id="bbs_go"><a href="/Project_printshop/Page_cont?cmd=bbs">게시판</a>
						<ul class="bbsmenu">
							<li><a href="/Project_printshop/Page_cont?cmd=bbs&b_category=0">공지사항</a></li>
							<li><a href="/Project_printshop/Page_cont?cmd=bbs&b_category=1">문의게시판</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</body>
</html>