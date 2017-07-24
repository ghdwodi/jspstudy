package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Ajax_JsonCommand;
import com.hb.model.Command;

@WebServlet("/Controller5")
public class Controller5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Controller5() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String result = null;
		Command comm = new Ajax_JsonCommand();
		result = comm.exec(request, response);
		out.println(result);
	}
}
