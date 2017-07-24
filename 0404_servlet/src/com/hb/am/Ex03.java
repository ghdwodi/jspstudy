package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex03() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 웹페이지 이동 : 리다이렉트, 포워딩
		// 페이지에서 페이지 사이로 이동할 때 정보를 가지고 이동한다.
		// 이 때 이 정보를 parameter라고 한다.
		// 파라미터는 무조건 String, String[]이다.
		// 파라미터 형식 : ?name=값&name=값&name=값&name=값

		// 파라미터값을 받는 메소드들 -> 전부 request에 적용
		// 1. getParameter()		: 일반적인 하나의 파라미터값을 받는다.
		// 2. getParameterValues()	: 체크박스 등 배열 형식을 받는다.
		// 3. getParameterMap()		: 맵 형식의 파라미터값을 받는다.
		// 4. getParameterNames()	: 열거형 파라미터값을 받는다.
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<h1>서블릿 두번째 예제</h1>");
		// name, age라는 파라미터값이 넘어온 경우 처리 방법
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		out.println("이름 : "+name+"<br />");
		out.println("나이 : "+age+"<br />");
		
		out.close();
	}
}
