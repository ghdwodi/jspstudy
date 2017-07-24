package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.myguestbook.DAO;

public class DeleteCommand implements Command{
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) {
		// insert, delete, update는 수동커밋이 기본 => 반드시 나중에 커밋
		DAO.getDelete(request.getParameter("idx"));
	}
}
