package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.myguestbook.DAO;
import com.hb.myguestbook.VO;

public class ListCommand implements Command{
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) {
		List<VO> list = DAO.getList();
		request.setAttribute("list", list);		
	}
}
