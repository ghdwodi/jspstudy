package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex08")
public class Ex08 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex08() {
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
		out.print("여기는 Ex08페이지입니다.<br />");
		out.print("ID : "+id+"<br />");
		out.print("PASSWORD : "+pw);
		out.print("</h2>");
	}

}
