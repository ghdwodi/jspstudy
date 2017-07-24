package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class DeleteCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		int res = DAO.getDelete(idx);
		String result="삭제 실패";
		if(res>0){
			result="삭제 성공";
		}
		return result;
	}
}
