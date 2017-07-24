package com.hb.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Command;
import com.hb.model.HelloCommand;
import com.hb.model.HiCommand;

/**
 * Servlet implementation class MyCon03
 */
@WebServlet("/MyCon03")
public class MyCon03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MyCon03() {
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
		
		// 요청을 분석해서 요청기능을 수행할 모델을 호출
		Command comm = null;
		comm = new HelloCommand();
		
		// 결과에 맞는 뷰를 호출
		String path = comm.exec(request, response);

		// 포워딩, 리다이렉트 방식 사용
		// 포워드 : 기존의 request와 response를 그대로 가지고 간다.
		// 리다이렉트 : 새로운 request와 response를 가지고 간다.
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
