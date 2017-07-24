package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex07")
public class Ex07 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex07() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		out.print("<h2>");
		out.print("여기는 Ex07페이지입니다.<br />");
		out.print("ID : "+id+"<br />");
		out.print("PASSWORD : "+pw);
		out.print("</h2>");
		
		// 웹페이지 이동 : <a>링크, 포워딩, 리다이렉트
		
		// 1. <a>링크 : 정확히 따지자면 <a>는 포워딩도 리다이렉트도 아닌 단순 링크이다.
//		out.print("<hr />");
//		out.print("<a href='/0405_servlet/Ex08?id="+id+"&pw="+pw+"'>이동</a>");
		
		// 2. Redirect : 페이지 이동하면서 request와 response가 새롭게 생성된다.
		//				 기존 parameter는 없어지고 새로 만들어지는 것이다.
		//				 request의 생명주기는 response를 하면 끝난다.
		//				 URL을 확인했을 때 변한다.
		// 				 사용법 : response.sendRedirect("이동할 주소");
//		response.sendRedirect("Ex08");
		
		// 3. 포워딩 : 기존의 request와 response를 사용한다.
		//			 기존의 parameter값을 유지한다.
		//			 URL을 확인해 보면 그대 유지되어 있다.
		// 사용법 : parameter.getrequesDispatcher("이동할 주소").forward(request, reponse);
		request.getRequestDispatcher("Ex08").forward(request, response);
	}
}
