package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//localhost:8090/프로젝트이름/url매핑
@WebServlet("/Index")
public class Ex02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex02() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제 작업 공간
		// 무조건 3개 작성 (한글처리 2개, 출력처리 1개)
		request.setCharacterEncoding("utf-8");
		// 응답시 한글 처리
		response.setContentType("text/html; charset=utf-8");
		// 출력 처리 => outputStream => PrintWriter
		PrintWriter out = response.getWriter();
		
		// 브라우저에 마음대로 출력(응답)
		out.print("<h2>서블릿 첫 예제</h2>");
		// 오늘 날짜(연월일)
		Date date = Calendar.getInstance().getTime();
		String today = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
//		Calendar cal = Calendar.getInstance();
//		int year = cal.get(Calendar.YEAR);
//		int month = cal.get(Calendar.MONTH)+1;
//		int day = cal.get(Calendar.DATE);
		
		out.print("<h2>");
		out.println(today);
		out.print("</h2>");
		
		// 요청 정보에 대해 출력하시오
		out.print("<h2>");
		out.print(request.getRemoteAddr()+"<br />");
		out.print(request.getRemoteHost()+"<br />");
		out.print(request.getRemoteUser()+"<br />");
		out.print(request.getRemotePort()+"<br />");
		out.print("</h2>");
		
		out.close();
	}

}
