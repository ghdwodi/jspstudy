<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>영역과 속성 : 데이터 저장과 호출</title>
	</head>
	<body>
	<%--
		웹 어플리케이션은 4가지 영역을 사용해서 데이터를 저장/호출한다. 
		pageContext객체 : 하나의 페이지를 처리할 때 사용하는 영역으로 'page영역'이라고 한다.
					해당 페이지를 벗어나면 정보가 삭제된다.
		request객체 : 하나의 요청을 처리할 때 사용하는 영역으로 'request영역'이라고 한다.
					response를 하면 정보가 삭제된다.
					포워드는 같은 request영역을 사용하고, 리다이렉트는 새로운 request영역을 사용한다.
		session객체 : 하나의 웹 브라우저와 관련된 영역으로 'session영역'이라고 한다.
					웹 브라우저를 종료하면 정보가 삭제된다.
		application객체 : 하나의 웹 어플리케이션과 관련된 영역으로 'application영역'이라고 한다.
					어플리케이션이 종료되면 정보가 삭제된다. 
		
		데이터를 저장하는 목적 : 페이지 사이에 정보를 주고받거나 공유하는 것
		데이터 저장 : 객체.setAttribute("이름",값)
		데이터 호출 : 객체.getAttribute("이름")
		 		
	--%>
	</body>
</html>