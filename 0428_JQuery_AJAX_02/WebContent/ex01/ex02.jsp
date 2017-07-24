<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%-- ex01방식의 단점 : IE6 이하는 XMLHttpRequest가 없다. --%>
		<%-- 대신 ActiveXObject 형태로 지원하는 것이 있다. --%>
		<script type="text/javascript">
			function createRequest() {
				var request;
				try {
					// IE 7.0 이상
					request = new XMLHttpRequest();
				} catch (e) {
					try {
						// IE 6.0 이하
						request = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						request = new ActiveXObject("Msxml3.XMLHTTP");
					}
				}
				return request;
			}
			// 1. 객체 생성(ActiveXObject)
			var request = createRequest();
			
			// 2. open("전송 방식","경로","비동기여부");
			request.open("GET","data.html",false);
			
			// 3. send() : 실행
			request.send();
			
			// 4. 화면에 출력
			document.body.innerHTML += request.responseText;
//			document.body.append(request.responseText);	// 태그 적용 없이 가지고 옴
		</script>
	</body>
</html>