package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class ListCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<VO> list = DAO.getList();
		String output = "<?xml version='1.0' encoding='UTF-8'?><members>";
		for (VO k : list) {
			output += "<member>";
			output += "<idx>"+k.getIdx()+"</idx>";
			output += "<id>"+k.getId()+"</id>";
			output += "<pwd>"+k.getPwd()+"</pwd>";
			output += "<name>"+k.getName()+"</name>";
			output += "<age>"+k.getAge()+"</age>";
			output += "<addr>"+k.getAddr()+"</addr>";
			output += "</member>";
		}
		output += "</members>";
		return output;
	}
}
