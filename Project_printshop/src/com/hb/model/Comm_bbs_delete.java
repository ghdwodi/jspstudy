package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;

public class Comm_bbs_delete implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int result = DAO.getBBSDelete(request.getParameter("b_idx")); 
		if(result > 0){
			return "삭제 성공.";
		}else{
			return "삭제 실패.";
		}
	}
}
