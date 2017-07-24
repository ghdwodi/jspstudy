package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybbs.DAO;


public class Command_ansDelete implements Command{
	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		DAO.getCommDelete(request.getParameter("c_idx"));
		return "Control_bbs?cmd=view&b_idx="+request.getParameter("b_idx");
	}

}
