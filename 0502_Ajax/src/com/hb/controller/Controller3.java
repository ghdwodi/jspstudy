package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Command;
import com.hb.model.IdChkCommand;
import com.hb.model.InsertCommand;
import com.hb.model.ListCommand;

@WebServlet("/Controller3")
public class Controller3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Controller3() {
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
		
		Command comm = new InsertCommand();
		String output = comm.exec(request, response);
		
		out.println(output);
	}
}
