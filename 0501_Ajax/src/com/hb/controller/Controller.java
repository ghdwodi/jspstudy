package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Command;
import com.hb.model.JsonCommand;
import com.hb.model.ListCommand;
import com.hb.model.XmlAttrCommand;
import com.hb.model.XmlCommand;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
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
		
		String type = request.getParameter("type");
		String path = null;
		Command comm = null;
		
		if(type.equals("list")){
			comm = new ListCommand();
		}else if(type.equals("list_xml")){
			comm = new XmlCommand();
		}else if(type.equals("list_xml_attr")){
			comm = new XmlAttrCommand();
		}else if(type.equals("list_json")){
			comm = new JsonCommand();
		}
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
}
