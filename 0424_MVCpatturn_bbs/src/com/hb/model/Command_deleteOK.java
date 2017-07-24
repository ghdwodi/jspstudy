package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybbs.DAO;

public class Command_deleteOK implements Command{
	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		// 글에 댓글이 있는 경우 무결성 참조 오류가 발생함에 주의
		try{
			DAO.getAllCommDelete(b_idx);
			DAO.getDelete(b_idx);
		}catch(Exception e){
		}
		return "Control_bbs?cmd=list";
	}

}
