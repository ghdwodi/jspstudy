package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex05")
public class Ex05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex05() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		double average = (double)((kor+eng+math)*10/3)/10;
		String hak = "";
		if (average>=90) {
			hak = "A";
		} else if (average>=80) {
			hak = "B";
		} else if (average>=70) {
			hak = "C";
		} else if (average>=60) {
			hak = "D";
		} else {
			hak = "F";
		}
		
		out.print("<h2>"+name+"의 점수</h2>");
		out.print("<ul style='list-style-type: square;'>");
			out.print("<li>국어 : "+kor+"점</li>");
			out.print("<li>영어 : "+eng+"점</li>");
			out.print("<li>수학 : "+math+"점</li>");
			out.print("<li>평균 : "+average+"점</li>");
			out.print("<li>학점 : "+hak+"학점</li>");
		out.print("</ul>");
	}

}
