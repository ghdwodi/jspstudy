package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Command_write implements Command{
	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		return "write.jsp";
	}

}
