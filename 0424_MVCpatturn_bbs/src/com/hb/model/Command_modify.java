package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Command_modify implements Command{
	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		return "modify.jsp";
	}

}
