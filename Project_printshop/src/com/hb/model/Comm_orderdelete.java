package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;

public class Comm_orderdelete implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		DAO.getDeleteOrder(request.getParameter("o_idx"));
		return "";
	}
}
