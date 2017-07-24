<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기본 내장 객체들</title>
	</head>
	<body>
		<%--
		기본 객체 : jsp가 가지고 있는 기본적인 지원기능
				request,response,out,page,pageContext,session
				application,config,exception
		3. pageContext : 다른 모든 내장 객체에 대한 프로그램적인 접근 방법을 제공한다.
						pageContext 기본 객체를 직접 사용하는 경우는 드물다.
			※ 주요 메소드
			1) getRequest() : request 객체 얻기
			2) getResponse() : response 객체 얻기
			3) getOut() : out 객체 얻기
			4) getPage() : page 객체 얻기
			5) getSession() : session 객체 얻기
			6) getServletContext(): application 객체 얻기
			
			※ 영역과 속성에 대한 메소드
			※ 해당 page가 변경되면 생명주기가 끝난다.
			pageContext.setAttribute("이름", 속성값) : 속성 지정
			pageContext.getAttribute("이름") : 속성 호출
			
		4. application : 웹 어플리케이션(컨텍스트) 전체를 관리한다.
						해당 어플리케이션이 종료하면 생명주기가 끝난다.
			※ 영역과 속성에 대한 메소드
			application.setAttribute("이름", 속성값) : 속성 지정
			application.getAttribute("이름") : 속성 호출
			
		5. session : 서버와 클라이언트 간 접속을 유지시킨다.
					사용자와 관련된 정보가 클라이언트 측에 있으면 쿠키에 저장하고,
					서버 측에 있으면 세션에 저장한다.
					http는 데이터를 요청하고 결과를 받으면 연결이 바로 종료된다.(생명주기가 끝난다.)
					클라이언트가 서비스를 서버에 요청할 경우, 서버 측에서는 클라이언트를 식별하기 위한 세션ID를 부여한다.
					서버는 세션ID로 클라이언트의 이전 접속 유무를 알 수 있다.
					세션ID는 웹 브라우저가 종료되기 전까지 유지된다.(단, 시간제한을 두는 경우도 있다.)
					getID()
					invalidate() <= 초기화
			※ 영역과 속성에 대한 메소드
			session.setAttribute("이름", 속성값) : 속성 지정
			session.getAttribute("이름") : 속성 호출
			
		6. page : jsp에서 자기 자신을 참조할 때 사용한다.
				jsp 페이지를 구현한 자바 클래스 객체다.
				jsp 컨테이너에서 생성된 서블릿 객체를 참조하는 참조변수
		
		7. config : jsp페이지 설정 정보
		
		8. exception : 일반 페이지에서는 사용하지 않고 오류 페이지에서만 사용한다.
		--%>
	</body>
</html>