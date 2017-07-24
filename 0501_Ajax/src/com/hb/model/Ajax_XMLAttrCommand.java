package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class Ajax_XMLAttrCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer result = new StringBuffer();
		result.append("<?xml version='1.0' encoding='UTF-8'?><members>");
		List<VO> list = DAO.getList();
		for (VO k : list) {
			result.append(
					"<member"+
					" idx='"+k.getIdx()+
					"' id='"+k.getId()+
					"' pwd='"+k.getPwd()+
					"' name='"+k.getName()+
					"' age='"+k.getAge()+
					"' addr='"+k.getAddr()+
					"'/>"
			);
		}
		result.append("</members>");
		return result.toString();
	}
}
