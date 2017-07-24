package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Comm_logout implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("loginchk", -1);
		return "/view/main.jsp";
	}
}
