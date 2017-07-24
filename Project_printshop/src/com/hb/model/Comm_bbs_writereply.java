package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BBS_VO;
import com.hb.mybatis.DAO;

public class Comm_bbs_writereply implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRequestURI();
		if(path.substring(19,22).equals("Pag")){
			request.setAttribute("reply", 1);
			return "/view/bbs_write.jsp";
		}else{
			int groups = Integer.parseInt(request.getParameter("groups")); 
			int lev = Integer.parseInt(request.getParameter("lev"));
			int step = Integer.parseInt(request.getParameter("step"));
			lev++; step++;
			DAO.getUp_lev(groups, lev);
			BBS_VO bvo = new BBS_VO();
			bvo.setGroups(groups);
			bvo.setLev(lev);
			bvo.setStep(step);
			bvo.setC_idx(request.getParameter("c_idx"));
			bvo.setTitle(request.getParameter("title"));
			bvo.setContent(request.getParameter("content"));
			bvo.setB_category(request.getParameter("b_category"));
			DAO.getInsertReply(bvo);
			return "";
		}
	}
}
