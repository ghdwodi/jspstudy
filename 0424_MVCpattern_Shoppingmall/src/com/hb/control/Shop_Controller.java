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
import com.hb.model.Command_enroll;
import com.hb.model.Command_info;
import com.hb.model.Command_join;
import com.hb.model.Command_login;
import com.hb.model.Command_logout;
import com.hb.model.Command_shopping;

@WebServlet("/Shop_Controller")
public class Shop_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Shop_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String cmd = request.getParameter("cmd");
		Command comm = null;
		if(cmd.equals("login")){
			comm = new Command_login();
		}else if(cmd.equals("join")){
			comm = new Command_join();
		}else if(cmd.equals("info")){
			comm = new Command_info();
		}else if(cmd.equals("logout")){
			comm = new Command_logout();
		}else if(cmd.equals("enroll")){
			comm = new Command_enroll();
		}else if(cmd.equals("shopping")){
			comm = new Command_shopping();
		}
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
}
