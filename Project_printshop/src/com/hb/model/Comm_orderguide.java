package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Comm_orderguide implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "/view/orderguide.jsp";
	}
}
