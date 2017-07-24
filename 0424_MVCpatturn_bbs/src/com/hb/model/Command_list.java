package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybbs.BBS_VO;
import com.hb.mybbs.DAO;
import com.hb.mybbs.Paging;

public class Command_list implements Command{

	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		Paging p = new Paging(request.getParameter("cPage"));
		HttpSession session = request.getSession();
		session.setAttribute("cPage", request.getParameter("cPage"));
		List<BBS_VO> list = DAO.getList(p.getMap());
		request.setAttribute("p", p);
		request.setAttribute("list", list);
		
		return "list.jsp";
	}

}
