package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Comm_bbs_delete;
import com.hb.model.Comm_bbs_modify;
import com.hb.model.Comm_bbs_write;
import com.hb.model.Comm_bbs_writereply;
import com.hb.model.Command;

@WebServlet("/BBS_cont")
public class BBS_cont extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BBS_cont() {
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
		
		if(cmd.equals("write")){
			comm = new Comm_bbs_write();
		}else if(cmd.equals("reply")){
			comm = new Comm_bbs_writereply();
		}else if(cmd.equals("bbsmodify")){
			comm = new Comm_bbs_modify();
		}else if(cmd.equals("bbsdelete")){
			comm = new Comm_bbs_delete();
		}
		
		String output = comm.exec(request, response);
		out.print(output);
	}

}
