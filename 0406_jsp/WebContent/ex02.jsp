<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스크립트 요소 : 선언부, 스크립트릿, 표현식</title>
	</head>
	<body>
		<%--
		스크립트 요소
		1. 선언부 <%! %> : 전역변수, 메소드를 만들 때 사용
		2. 스크립트릿 <%  %> : 순수 자바 코드를 작성할 때 사용
		3. 표현식 <%= %> : 결과를 출력할 때 사용(변수값, 메소드 반환값 출력)
		※ 위 요소들은 서로 포함하거나 속할 수 없다.
		
		--%>
		<h2>
			<h3>0~10까지 출력</h3>
			<%		// 스트립트릿 : 순수 자바 코드
			for(int i=0;i<10;i++){%>
				i;			<%-- 변수 취급을 하지 않음 --%>
			<%}%>
			<hr />
			<%		// 스트립트릿 : 순수 자바 코드
			for(int i=0;i<10;i++){%>
				<%= i+1 %>	<%-- 표현식 --%>
			<%}%>
			<hr />
			<%for(int i=0;i<10;i++){
				out.println(i+1);	// 화면출력 내장 객체 : out
			}%>
			<hr />
			0~10까지 짝수의 합을 구하자<br />
			<%! int sum; %>
			<%
			for(int i=0;i<11;i++){
				if(i%2==0){
					sum += i;
				}
			}
			out.println("결과 : "+sum+"<br />");
			%>
			결과 : <%= sum %><br />
			<%
			int sum2=0;
			for(int i=0;i<11;i++){
				if(i%2==0){
					sum2 += i;
				}
			}
			out.println("결과 : "+sum2+"<br />");
			%>
			결과 : <%= sum %><br />
			<hr />
			<%-- 메소드를 사용하는 경우 --%>
			<%!
			public int add(int a, int b){
				return a + b;
			}
			int res;
			public void sub(int a, int b){
				res = a - b;
			}
			%>
			7 + 5 = <%= add(7,5) %><br />
			<% sub(7,5); %>
			7 - 5 = <%= res %>
			<hr />
			<%
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH)+1;
			int day = cal.get(Calendar.DATE);
			%>
			<%= "오늘 날짜 : "+year+"년 "+month+"월 "+day+"일" %>
		</h2>
	</body>
</html>