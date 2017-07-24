package com.hb.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model3.MyCommand;


/**
 * Servlet implementation class MyCon05
 */
@WebServlet("/MyCon05")
public class MyCon05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MyCon05() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		// 서블릿은 컨트롤러 역할을 한다.
		// 컨트롤러는 요청을 받아 분석하고, 요청한 기능을 수행할 모델을 호출한다.
		// 모델이 도출한 결과를 받아 그에 맞는 뷰를 호출하고 클라이언트에게 보낸다.
		MyCommand mycomm = new MyCommand();
		String path = mycomm.exec(request, response);
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
