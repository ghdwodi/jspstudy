<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=divice-width">
		<title>반응형 웹의 기초</title>
		<style type="text/css">
			body{background-color: gray;}
			/* 너비에 따라 색상 변경 */
			@media screen and (max-width:960px){
				body{background-color: green;}
			}
			@media screen and (max-width:500px){
				body{background-color: yellow;}
			}
			@media screen and (max-width:320px){
				body{background-color: orange;}
			}
		</style>
	</head>
	<body>
	<%--
		미디어 쿼리 : 사용자가 어떤 미디어를 사용하느냐에 따라 사이트 형태가 바뀌도록 CSS를 작성하는 방법이다.
		미디어 쿼리는 @media 속성을 사용해 특정 미디어에서 어떤 CSS를 적용할지 지정해 준다.
		예시 : @media screen and (min-width: 200px) and (max-width: 320px){적용 내용}
		=> 미디어 유형은 screen, 최소너비 200px, 최대너비 320px인 경우
		
		◆ 미디어 유형
		all => 모든 미디어
		tv => 음성과 영상을 동시 출력하는 미디어
		print => 인쇄장치
		aural => 화면을 읽어서 소리로 출력하는 장치
		braille => 점자 표시 장치
		handheld => PDA처럼 손에 들고 다니는 장치
		projection => 프로젝터
		
		뷰포트 : 실제 웹 문서 내용이 화면에 표시되는 영역이다. 아래 4가지 요소를 조합한다.
			width, height, min, max
			ex) min-width, max-height
	--%>
	</body>
</html>