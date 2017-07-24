package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex04")
public class Ex04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex04() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 반드시 해야 할 3가지
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String[] hobby = request.getParameterValues("hobby");
		
		out.print("<h2>결과 보기</h2>");
		out.print("<ul style='list-style-type: disc;'>");
			out.print("<li>이름 : "+name+"</li>");
			out.print("<li>아이디 : "+id+"</li>");
			out.print("<li>패스워드 : "+pw+"</li>");
			out.print("<li>이메일 : "+email+"</li>");
			out.print("<li>취미");
			out.print("<ul style='list-style-type: square;'>");
				for (String k : hobby) {
					out.print("<li>"+k+"</li>");
				}
				out.print("</ul>");
			out.print("</li>");
		out.print("</ul>");
		
	}
}
