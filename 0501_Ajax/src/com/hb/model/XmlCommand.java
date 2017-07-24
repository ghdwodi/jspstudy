package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class XmlCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<VO> list = DAO.getList();
		request.setAttribute("list", list);
		return "ex01/list_xml.jsp";
	}
}
