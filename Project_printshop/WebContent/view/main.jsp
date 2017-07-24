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
			var $imgList = $('.bgwrap>div');			// bgwrap div 안에 있는 div 자식들을 가져옴
			var nIndex = 0;						// 변경할 이미지의 Index
			function slide() {
				setInterval(function() {
					var next = (++nIndex % 2);
					if(next==1){
						$("#img1").fadeIn(1000);
						$("#img2").fadeOut(1000);
					}
					if(next==0){
						$("#img1").fadeOut(1000);
						$("#img2").fadeIn(1000);
					}
				}, 3000);		// Javascript setInterval 함수 호출
			}
		</script>
		<style type="text/css">
			.intro-wrap {
				float:left;
				width: 50%;
				overflow: hidden;
				margin-left: 0;
				padding-left: 0;
			}
			.bgwrap {
				float: left;
				width: 50%;
				margin-left: 0;
				padding-left: 0;
			}
			.intro-wrap > .bgwrap > div {
				float:left;
				left: 0px;
				top: 0px;
				background-color:#000;
				text-align: left;
				width: 50%;
				margin-left: 0;
				padding-left: 0;
			}
			.intro-wrap > .bgwrap > div > img {
				float:left;
				position:absolute;
				max-width: inherit;
				width: 55%;
				max-height: 55%;
			}
			nav{
				float: right;
				width: 40%;
			}
			#icons > fieldset > a{
				text-decoration: none;
			}
			.bg1{
				background-color: #F2F2F2
			}
			.bg2{
				background-color: #D9D9D9
			}
		</style>
	</head>
	<body onload="slide()">
		<jsp:include page="top.jsp"/>
		<div>
			<div class="intro-wrap">
				<div class="bgwrap">
					<div style="display: block;">
						<img id="img1" width="700" alt="intro_image_1" src="/Project_printshop/img/images/mainpage/main1.png"/>
					</div>
					<div style="display: block;">
						<img id="img2" width="700" alt="intro_image_2" src="/Project_printshop/img/images/mainpage/main2.png"/>
					</div>
				</div>
			</div>
			<nav>
				<fieldset>
					<legend style="font-weight: bold;font-size: 18px">공지사항</legend>
					<ul id="bbsul1" style="list-style: none;">
						<c:forEach var="k" items="${infolist}" varStatus="vs">
							<c:choose>
								<c:when test="${vs.index%2==0}">
									<li class="bg1">
								</c:when>
								<c:otherwise>
									<li class="bg2">
								</c:otherwise>
							</c:choose>
								<c:if test="${k.step>0}">
									<c:forEach begin="1" end="${k.step}">
										<img src="img/images/re.png" width="12px" height="15px">
									</c:forEach>
								</c:if>
								<a href="/Project_printshop/Page_cont?cmd=bbsview&cPage=1&b_category=0&b_idx=${k.b_idx}">${k.title}</a>
							</li>
						</c:forEach>
					</ul>
				</fieldset>
				<fieldset>
					<legend style="font-weight: bold;font-size: 18px">문의사항</legend>
					<ul id="bbsul2" style="list-style: none;">
						<c:forEach var="k" items="${qnalist}" varStatus="vs">
							<c:choose>
								<c:when test="${vs.index%2==0}">
									<li class="bg1">
								</c:when>
								<c:otherwise>
									<li class="bg2">
								</c:otherwise>
							</c:choose>
								<c:if test="${k.step>0}">
									<c:forEach begin="1" end="${k.step}">
										<img src="img/images/re.png" width="12px" height="15px">
									</c:forEach>
								</c:if>
								<a href="/Project_printshop/Page_cont?cmd=bbsview&cPage=1&b_category=1&b_idx=${k.b_idx}">${k.title}</a>
							</li>
						</c:forEach>
					</ul>
				</fieldset>
			</nav>
		</div>
		<div style="clear:both;"></div>
		<div id="icons" style="width: 60%; text-align: center; float: inherit;">
			<fieldset>
				<a href="/Project_printshop/Page_cont?cmd=bbs&b_category=1">
					<object title="문의게시판" width="110" data="/Project_printshop/img/images/mainpage/bbs.png" type="image/png">
						<p>문의게시판</p>
					</object>
				</a>
				<a href="/Project_printshop/Page_cont?cmd=orderguide">
					<object title="주문안내" width="110" data="/Project_printshop/img/images/mainpage/info.png" type="image/png">
						<p>주문안내</p>
					</object>
				</a>
				<a href="/Project_printshop/Page_cont?cmd=orderpage">
					<object title="주문" width="110" data="/Project_printshop/img/images/mainpage/order.png" type="image/png">
						<p>주문</p>
					</object>
				</a>
				<a href="/Project_printshop/Page_cont?cmd=orderlist">
					<object title="주문내역" width="110" data="/Project_printshop/img/images/mainpage/cart.png" type="image/png">
						<p>주문내역</p>
					</object>
				</a>
			</fieldset>
		</div>
	</body>
</html>