<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			*{margin: 0; padding: 0}
			img{border:  none; vertical-align: top ;}
			li img{width: 200px;}
			li{list-style: none;float: left; width: 200px;}
			h2{text-align: center;}
			#banner_wrap{width: 600px; padding: 20px;
						margin: 0 auto ; border: 1px solid #aaa;}
			#banner{width: 500000px;}	
			#frame{width: 600px; overflow: hidden;
			      position: relative; margin: 10px auto;}		
		</style>
		<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function(){
				var list = $("#banner");
				var show_num = 3 ; // 화면에 노출되는 그림의 개수
				var num = 0 ; // 이전, 다음 버튼 클릭하면 증감 되는 변수
				var total = $("li",list).length; // 5개
				// alert(total);
				var li_width = $("li:first",list).width(); // li의 너비 // 200 
			    // alert(li_width); 
				
				// li태그 중 인텍스값이 3보다 작아지면 li태그 복사
				var copyObj = $(">li:lt("+show_num+")",list).clone();
				list.append(copyObj);
				
				// 다음버튼
				$(".next").bind("click",function(){
					if(num == total){  //num가 5인경우
						num = 0;
						list.css("margin-left",num);
					}
					num++;
					list.stop().animate({marginLeft:-li_width*num+"px"},400);
					return false;
				});
				// 이전버튼
				$(".prev").bind("click",function(){
					if(num == 0){  //num가 5인경우
						num = total;
						list.css("margin-left",-li_width*num+"px");
					}
					num--;
					list.stop().animate({marginLeft:-li_width*num+"px"},400);
					return false;
				});
			});
		</script>
	</head>
	<body>
		<h2>롤링 슬라이드 배너 만들기</h2>
		<br /><br /><br /><br /><br /><br />
		<div id = "banner_wrap">
			<div id="frame">
				<ul id="banner">
					<li><a href="#"><img src="JQuery_img/pic_1.jpg"/></a></li>
					<li><a href="#"><img src="JQuery_img/pic_2.jpg"/></a></li>
					<li><a href="#"><img src="JQuery_img/pic_3.jpg"/></a></li>
					<li><a href="#"><img src="JQuery_img/pic_4.jpg"/></a></li>
					<li><a href="#"><img src="JQuery_img/pic_5.jpg"/></a></li>
				</ul>
			</div>
			<p>
				<a href="#" class="prev"><img src="JQuery_img/prev_btn.png" /></a>
				이동하기
				<a href="#" class="next"><img src="JQuery_img/next_btn.png" /></a>
			</p>
		</div>
	</body>
</html>