package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex09")
public class Ex09 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex09() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int cmd = Integer.parseInt(request.getParameter("cmd"));
		Ex09_1 test = null;
		switch (cmd) {
		case 1:		// IP구하기
			test = new Ex09_2();
			break;
		case 2:		// 오늘 날짜 구하기
			test = new Ex09_3();
			break;
		}
		String res = test.play(request, response);
		out.println("<h2>결과 : "+res+"</h2>");
	}

}
