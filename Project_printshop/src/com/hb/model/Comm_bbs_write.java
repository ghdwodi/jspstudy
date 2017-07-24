package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BBS_VO;
import com.hb.mybatis.DAO;

public class Comm_bbs_write implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRequestURI();
		if(path.substring(19,22).equals("Pag")){
			return "/view/bbs_write.jsp";
		}else{
			BBS_VO bvo = new BBS_VO();
			bvo.setC_idx(request.getParameter("c_idx"));
			bvo.setTitle(request.getParameter("title"));
			bvo.setContent(request.getParameter("content"));
			bvo.setB_category(request.getParameter("b_category"));
			DAO.getWrite(bvo);
			return "";
		}
	}
}
