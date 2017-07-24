package com.hb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Comm_order;
import com.hb.model.Command;

/**
 * Servlet implementation class SendMail_cont
 */
@WebServlet("/SendMail_cont")
public class SendMail_cont extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SendMail_cont() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
		Command comm = null;
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		if(cmd.equals("order")){		// 주문하기
			comm = new Comm_order();
		}
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		if(request.getSession().getAttribute("loginchk")!=null){
			System.out.println("로그인체커 : "+(int)request.getSession().getAttribute("loginchk"));
		}
	}

}
