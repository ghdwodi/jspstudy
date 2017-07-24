package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class Ajax_TextCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer result = new StringBuffer();
		List<VO> list = DAO.getList();
		for (VO k : list) {
			result.append(k.getIdx()+",");
			result.append(k.getId()+",");
			result.append(k.getPwd()+",");
			result.append(k.getName()+",");
			result.append(k.getAge()+",");
			result.append(k.getAddr()+"/");
		}
		return result.toString();
	}
}
