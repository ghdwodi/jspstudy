package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeptCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String deptno = request.getParameter("deptno");
		return "dept.jsp";
	}
}
