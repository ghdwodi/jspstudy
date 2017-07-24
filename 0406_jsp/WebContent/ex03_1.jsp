<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기본 내장 객체 : request</title>
		<style type="text/css">
			fieldset{width: 300px;}
		</style>
		<script type="text/javascript">
			function send_go(f) {
				// 유효성 검사
				if(document.f.name.value==""){
					alert("이름을 입력하세요");
					document.f.name.focus();
					return;
				}
				if(document.f.age.value==""){
					alert("나이를 입력하세요");
					document.f.age.focus();
					return;
				}
				if(document.f.address.value==""){
					alert("주소를 입력하세요");
					document.f.address.focus();
					return;
				}
				var gender = document.f.gender;
				var hobby = document.f.hobby;
				var addr2 = document.f.addr2;
				var play = document.f.play;
				var hobbyCnt = 0;
				var playCnt = 0;
				
				if(gender[0].checked==false && gender[1].checked==false){
					alert("성별을 선택하세요");
					gender[0].focus();
					return;
				}
				for (var i = 0; i < hobby.length; i++) {
					if(hobby[i].checked == true){
						hobbyCnt++;
					}
				}
				if(hobbyCnt==0){
					alert("취미를 하나 이상 선택하세요");
					hobby[0].focus();
					return;
				}
				if(addr2[0].selected==true){
					alert("거주지를 선택하세요");
					addr2[0].focus();
					return;
				}
				for (var i = 0; i < play.length; i++) {
					if(play[i].selected == true){
						playCnt++;
					}
				}
				if(playCnt==0){
					alert("선호 종목을 하나 이상 선택하세요");
					play[0].focus();
					return;
				}
				
				// form정보를 다른 jsp에 넘긴다.
				f.action = "ex03_2.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<%--
		기본 객체 : jsp가 가지고 있는 기본적인 지원기능
				request,response,out,page,pageContext,session
				application,config,exception
		1. request : 클라이언트의 요청 정보 저장
			1) getRemoteAddr() : 클라이언트의 IP주소를 구한다.
			2) getContentLength() : 클라이언트가 전송한 요청 정보의 길이를 구한다.(알 수 없으면 -1)
			3) getCharacterEncoding() : 클라이언트가 전송한 요청 정보의 캐릭터인코딩을 구한다.
			4) getContentType() : 클라이언트가 전송한 요청 정보의 콘텐트타입을 구한다.
			5) getProtocol() : 클라이언트가 요청한 프로토콜을 구한다.
			6) getMethod() : 웹 브라우저가 정보를 전송할 때 사용한 방식을 구한다.
			7) getRequestURI() : 웹 브라우저가 요청한 URL에서 경로를 구한다.
			8) getContextPath() : JSP페이지가 속한 웹 어플리케이션의 컨텍스트 경로를 구한다.
			9) getServerName() : 연결할 때 사용한 서버 이름을 구한다.
			10) getServerPort() : 서버가 실행중인 포트 번호를 구한다.
			
			///////////////////////////////////////////////////////
			※ 요청 파라미터 관련 메소드
			1) getParameter(String name) : 반환형은 String
			2) getParameterValues(String name) : 반환형은 String[]
			3) getParameterMap() : 반환형은 Map
			4) getParameterName() : 반환형은 Enumeration(열거형)
			
			///////////////////////////////////////////////////////
			※ 포워딩 메소드
			request.getRequestDispatcher("이동할 곳").forward(request, response)
			
			///////////////////////////////////////////////////////
			※ 기타 주요 메소드
			request.getSession() : 세션 호출시 사용
			request.setAttribute("이름", 속성값) : 속성 지정
			request.getAttribute("이름") : 속성 호출
			
			///////////////////////////////////////////////////////
			※ 헤더 관련 메소드(p.89)
			1) getHeader(String name) : 지정한 이름의 헤더 값을 구한다. 반환형은 String
			2) getHeaders(String name) : 지정한 이름의 헤더 목록을 구한다. 반환형은 Enumeration(열거형)
			3) getHeaderNames() : 모든 헤더의 이름을 구한다. 반환형은 Enumeration(열거형)
			4) getIntHeader(String name) : 지정한 헤더의 값을 정수 값으로 읽어 온다.
			5) getDateHeader(String name) : 지정한 헤더의 값을 시간값으로 읽어온다. 반환형은 long  
		--%>
		<form name="f">
			<fieldset>
				<legend>정보 전송</legend>
				<p>이름 : <input type="text" name="name" /></p>
				<p>나이 : <input type="number" name="age" /></p>
				<p>주소 : <input type="text" name="address" /></p>
				<p>성별 :
					<input type="radio" name="gender" value="남성" />남
					<input type="radio" name="gender" value="여성" />여
				</p>
				<p>취미 :
					<input type="checkbox" name="hobby" value="운동" />운동
					<input type="checkbox" name="hobby" value="독서" />독서
					<input type="checkbox" name="hobby" value="영화" />영화
					<input type="checkbox" name="hobby" value="게임" />게임
				</p>
				<p>거주지 :
					<select name="addr2">
						<option>::선택하세요</option>
						<option value="서울">서울</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="부산">부산</option>
						<option value="광주">광주</option>
					</select>				
				</p>
				<p>운동 :
					<select name="play" multiple="multiple">
						<option>::선호 종목</option>
						<option value="야구">야구</option>
						<option value="축구">축구</option>
						<option value="농구">농구</option>
						<option value="배구">배구</option>
						<option value="당구">당구</option>
					</select>				
				</p>
				<p><input type="button" value="보내기" onclick="send_go(this.form)" /></p>
				<p><input type="reset" value="취소" /></p>
			</fieldset>
		</form>
	</body>
</html>