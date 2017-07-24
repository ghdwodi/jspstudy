package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class Ajax_XMLCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer result = new StringBuffer();
		result.append("<?xml version='1.0' encoding='UTF-8'?><members>");
		List<VO> list = DAO.getList();
		for (VO k : list) {
			result.append("<member>");
			result.append("<idx>"+k.getIdx()+"</idx>");
			result.append("<id>"+k.getId()+"</id>");
			result.append("<pwd>"+k.getPwd()+"</pwd>");
			result.append("<name>"+k.getName()+"</name>");
			result.append("<age>"+k.getAge()+"</age>");
			result.append("<addr>"+k.getAddr()+"</addr>");
			result.append("</member>");
		}
		result.append("</members>");
		return result.toString();
	}
}
