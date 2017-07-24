package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybbs.Comm_VO;
import com.hb.mybbs.DAO;

public class Command_ansWrite implements Command{
	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		Comm_VO cvo = new Comm_VO();
		cvo.setB_idx(request.getParameter("b_idx"));
		cvo.setContent(request.getParameter("content"));
		cvo.setPwd(request.getParameter("pwd"));
		cvo.setWriter(request.getParameter("writer"));
		cvo.setIp(request.getRemoteAddr());
		DAO.getCommentInsert(cvo);
		return "Control_bbs?cmd=view&b_idx="+request.getParameter("b_idx");
	}

}
