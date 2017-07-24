<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax 사용하기</title>
		<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
		<script type="text/javascript">
			$(function() {
				$.ajax({	// 이하 순서관계없음
					dataType : "script",	// 응답 결과의 데이터 형태
//					data : 					// 가지고 올 정보
					type : "get",			// 전송방식(get,post)
					url : "ex01.js",		// 정보 위치
					success : function() {	// 성공했을 때 실행
						// 스크립트 함수 호출
						ok("성공");
					},
					error :	function() {	// 실패했을 때 실행
						alert("실패");
					}				
				});
			});
		</script>
	</head>
	<body>
	</body>
</html>