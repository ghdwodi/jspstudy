package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BBS_VO;
import com.hb.mybatis.DAO;

public class Comm_bbs_modify implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRequestURI();
		if(path.substring(19,22).equals("Pag")){
			return "/view/bbs_modify.jsp";
		}else{
			BBS_VO bvo = new BBS_VO();
			bvo.setTitle(request.getParameter("title"));
			bvo.setContent(request.getParameter("content"));
			bvo.setB_idx(request.getParameter("b_idx"));
			DAO.getBBSModify(bvo);
			return "";
		}
	}
}
