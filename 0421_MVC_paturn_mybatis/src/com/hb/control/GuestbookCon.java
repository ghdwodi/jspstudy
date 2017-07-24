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
import com.hb.model.DeleteCommand;
import com.hb.model.InsertCommand;
import com.hb.model.ListCommand;
import com.hb.model.UpdateCommand;

@WebServlet("/GuestbookCon")
public class GuestbookCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GuestbookCon() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String cmd = request.getParameter("cmd");
		String path = "list.jsp";
		Command comm = null;
		if(cmd.equals("insert")){
			comm = new InsertCommand();
		}else if(cmd.equals("list")){
			comm = new ListCommand();
		}else if(cmd.equals("update")){
			comm = new UpdateCommand();
			path="onelist.jsp";
		}else if(cmd.equals("delete")){
			comm = new DeleteCommand();
		}
		
		comm.exec(request, response);
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}