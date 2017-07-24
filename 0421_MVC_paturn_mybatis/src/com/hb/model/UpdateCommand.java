package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.myguestbook.DAO;
import com.hb.myguestbook.VO;

public class UpdateCommand implements Command{
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) {
		VO vo = new VO();
		vo.setIdx(request.getParameter("idx"));
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setEmail(request.getParameter("email"));
		vo.setContent(request.getParameter("content"));
		DAO.getUpdate(vo);
	}
}
