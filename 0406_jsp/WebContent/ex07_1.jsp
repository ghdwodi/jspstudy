<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>속성을 이용한 세션 사용</title>
		<script type="text/javascript">
			function send_go1() {
				location.href="ex07_2.jsp";
			}
			function send_go2() {
				location.href="ex07_3.jsp";
			}
			function send_go3() {
				location.href="ex07_4.jsp";
			}
		</script>
	</head>
	<body>
	<%
		String name = null;
		int age;
		String addr = null;
		if(session.getAttribute("name")!=null){
			name = (String)session.getAttribute("name");
		} else {
			name = "세션 값 없음";
		}
		if(session.getAttribute("age")!=null){
			age = (int)session.getAttribute("age");
		} else {
			age = 0;
		}
		if(request.getAttribute("addr")!=null){
			addr = (String)request.getAttribute("addr");
		} else {
			addr = "세션 값 없음";
		}
	%>
		<h1>세션 테스트</h1>
		<button onclick="send_go1()">세션값 저장</button>
		<button onclick="send_go2()">세션값 삭제</button>
		<button onclick="send_go3()">세션값 초기화</button>
		<hr />
		<h2>이름 : <%= name %></h2>
		<h2>나이 : <%= age %></h2>
		<h2>주소 : <%= addr %></h2>
	</body>
</html>