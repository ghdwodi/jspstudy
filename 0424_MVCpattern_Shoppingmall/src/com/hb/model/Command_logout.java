package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Command_logout implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "login.jsp";
	}
}
