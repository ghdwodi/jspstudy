package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;

public class Comm_main implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("infolist", DAO.getBBSHeadList("0"));
		request.getSession().setAttribute("qnalist", DAO.getBBSHeadList("1"));
		request.getSession().setAttribute("cPage", "1");
		return "/view/main.jsp";
	}
}