package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BBS_VO;
import com.hb.mybatis.DAO;

public class Comm_viewbbs implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
		}
		BBS_VO bvo = DAO.getOneBBSList(request.getParameter("b_idx"));
		String cPage = request.getParameter("cPage");
		request.getSession().removeAttribute("cPage");
		request.getSession().setAttribute("cPage", cPage);
		String b_category=null;
		if(request.getSession().getAttribute("b_category")==null){
			b_category="0";
		}else{
			b_category=(String)request.getSession().getAttribute("b_category");
		}
		request.getSession().setAttribute("b_category", b_category);
		int hit = bvo.getHit()+1;
		bvo.setHit(hit);
		DAO.getHit(bvo);
		request.getSession().setAttribute("bvo", bvo);
		return "/view/bbsview.jsp";
	}
}
