package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Comm_order;
import com.hb.model.Comm_orderlist;
import com.hb.model.Comm_idchk;
import com.hb.model.Comm_join;
import com.hb.model.Comm_login;
import com.hb.model.Comm_modify;
import com.hb.model.Command;

@WebServlet("/Customer_cont")
public class Customer_cont extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Customer_cont() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(request.getRequestURI());
		System.out.println(request.getRequestURL().toString());
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		Command comm = null;
		if(cmd.equals("login")){
			comm = new Comm_login();
		}else if(cmd.equals("idchk")){
			comm = new Comm_idchk();
		}else if(cmd.equals("join")){
			comm = new Comm_join();
		}else if(cmd.equals("modify")){
			comm = new Comm_modify();
		}else if(cmd.equals("onelist")){
			comm = new Comm_orderlist();
		}
		
		String output = comm.exec(request, response);
		out.print(output);
	}
}