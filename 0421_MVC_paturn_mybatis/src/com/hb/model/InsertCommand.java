package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.myguestbook.DAO;
import com.hb.myguestbook.VO;

public class InsertCommand implements Command{
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) {
		VO vo = new VO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setEmail(request.getParameter("email"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setContent(request.getParameter("content"));
		DAO.getInsert(vo);
	}
}
