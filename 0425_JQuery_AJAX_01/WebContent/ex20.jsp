<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>setInterval/clearInterval(자바스크립트)</title>
		<style type="text/css">
		</style>
		<script type="text/javascript">
			var news = [
				"['대선 레이스' 중반부] '토론 주간'에도 치열한 유세戰…文 '수도권' ...포토머니투데이",
				"[더불어민주당 대선후보 관련 뉴스] 文, 국방 강조하며 '안보 대통령...포토서울신문",
				"[자유한국당 대선후보 관련 뉴스] 홍준표 '박근혜 득표율 80%만 복원...포토동아일보",
				"[국민의당 대선후보 관련 뉴스] 安 '제주가 녹색태풍 일으켜달라…대...포토연합뉴스",
				"[바른정당 대선후보 관련 뉴스] 소신이냐, 현실이냐…바른정당 '딜..."
			]
			var timer;
			var index = 0;
			function start_news() {
				// 2초마다 실행, 콜백함수 호출
				timer = setInterval(function() {
					var div = document.getElementById("myDiv");
					div.innerHTML = news[index++];
					if(index==news.length){index=0;}
				}, 2000);
			}
			function stop_news(){
				clearInterval(timer);
			}
		</script>
	</head>
	<body>
		<div id="myDiv"></div>
		<hr />
		<input type="button" value="뉴스보기" onclick="start_news()"/>
		<input type="button" value="뉴스중지" onclick="stop_news()"/>
	</body>
</html>