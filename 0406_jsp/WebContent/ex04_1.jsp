<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기본 내장 객체 : response</title>
		<script type="text/javascript">
			function send_go(f) {
				if (document.f.id.value==""){
					alert("ID를 입력하십시오!");
					document.f.id.focus();
					return;
				} if (document.f.pw.value=="") {
					alert("비밀번호를 입력하십시오!");
					document.f.pw.focus();
					return;
				}
				f.action="ex04_2.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<%--
		기본 객체 : jsp가 가지고 있는 기본적인 지원기능
				request,response,out,page,pageContext,session
				application,config,exception
		2. response : request의 반대 기능(응답 정보)
			- 헤더 정보 입력(p.91)
			- 리다이렉트 하기
		※ 포워딩(페이지 이동) : a링크, 리다이렉트, 포워드
		--%>
		<form name="f">
			<p>ID : <input type="text" name="id" /></p>
			<p>PW : <input type="text" name="pw" /></p>
			<input type="button" value="보내기" onclick="send_go(this.form)" />
			<input type="reset" value="취소" />
		</form>
	</body>
</html>