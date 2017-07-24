package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;

public class Comm_idchk implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String c_id = request.getParameter("c_id");
		return DAO.getIdChk(c_id);
	}
}
