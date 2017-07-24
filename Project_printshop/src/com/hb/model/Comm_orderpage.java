package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;

public class Comm_orderpage implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("pfVo", DAO.getPaperformList());
		request.getSession().setAttribute("ptVo", DAO.getPrintingList());
		request.getSession().setAttribute("ipVo", DAO.getInnerpaperList());
		request.getSession().setAttribute("coverVo", DAO.getCoverList());
		request.getSession().setAttribute("bindVo", DAO.getBindList());
		return "/view/order.jsp";
	}
}
