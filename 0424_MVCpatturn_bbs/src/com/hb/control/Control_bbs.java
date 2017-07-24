package com.hb.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Command;
import com.hb.model.Command_ansDelete;
import com.hb.model.Command_ansWrite;
import com.hb.model.Command_delete;
import com.hb.model.Command_deleteOK;
import com.hb.model.Command_download;
import com.hb.model.Command_list;
import com.hb.model.Command_modify;
import com.hb.model.Command_modifyOK;
import com.hb.model.Command_view;
import com.hb.model.Command_write;
import com.hb.model.Command_writeOK;

@WebServlet("/Control_bbs")
public class Control_bbs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Control_bbs() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
		
		String cmd = request.getParameter("cmd");
		Command comm = null;
		if(cmd.equals("list")){
			comm = new Command_list();
		}else if(cmd.equals("view")){
			comm = new Command_view();
		}else if(cmd.equals("write")){
			comm = new Command_write();
		}else if(cmd.equals("write_ok")){
			comm = new Command_writeOK();
		}else if(cmd.equals("modify")){
			comm = new Command_modify();
		}else if(cmd.equals("modify_ok")){
			comm = new Command_modifyOK();
		}else if(cmd.equals("delete")){
			comm = new Command_delete();
		}else if(cmd.equals("delete_ok")){
			comm = new Command_deleteOK();
		}else if(cmd.equals("download")){
			comm = new Command_download();
		}else if(cmd.equals("ans_write")){
			comm = new Command_ansWrite();
		}else if(cmd.equals("ans_delete")){
			comm = new Command_ansDelete();
		}
		String path = comm.exac(request, response);
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
