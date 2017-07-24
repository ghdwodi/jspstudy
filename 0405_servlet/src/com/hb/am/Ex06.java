package com.hb.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex06")
public class Ex06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex06() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		String calc = request.getParameter("sel");
		int res = 0;
		
		if (calc.equalsIgnoreCase("+")) {
			res = su1 + su2;
		} else if (calc.equalsIgnoreCase("-")) {
			res = su1 - su2;
		} else if (calc.equalsIgnoreCase("×")) {
			res = su1 * su2;
		} else if (calc.equalsIgnoreCase("÷")) {
			res = su1 / su2;
		}
		
		out.print("<h1>"+su1+" "+calc+" "+su2+" = "+res+"</h1>");
	}

}
