package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class Ajax_JsonCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer result = new StringBuffer();
		result.append("[");
		List<VO> list = DAO.getList();
		for (VO k : list) {
			result.append("{");
			result.append("\"idx\":"+k.getIdx()+",");
			result.append("\"id\":"+k.getId()+",");
			result.append("\"pwd\":"+k.getPwd()+",");
			result.append("\"name\":"+k.getName()+",");
			result.append("\"age\":"+k.getAge()+",");
			result.append("\"addr\":"+k.getAddr());
			result.append("},");
		}
		String res = result.toString().substring(0,result.length()-1)+"]";
		return res;
	}
}
