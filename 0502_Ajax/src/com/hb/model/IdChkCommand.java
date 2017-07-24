package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;

public class IdChkCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		return DAO.getIdChk(id);
	}
}
