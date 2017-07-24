package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Comm_order;
import com.hb.model.Comm_order_img;
import com.hb.model.Comm_orderdelete;
import com.hb.model.Command;

@WebServlet("/Order_cont")
public class Order_cont extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Order_cont() {
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
		if(cmd.equals("calc")){
			comm = new Comm_order();
		}else if(cmd.equals("del_order")){
			comm = new Comm_orderdelete();
		}else if(cmd.equals("img")){
			comm = new Comm_order_img();
		}
		
		String output = comm.exec(request, response);
		out.print(output);
	}

}
