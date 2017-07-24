package com.hb.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.myguestbook.DAO;
import com.hb.myguestbook.VO;

public class SearchCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		if(idx==null && keyword==null){
			return "search.jsp";
		}else{
			Map<String, String> map = new HashMap<>();
			map.put("idx", idx);
			map.put("keyword", keyword);
			List<VO> k_list = DAO.getSearch(map);
			request.setAttribute("k_list", k_list);
			request.setAttribute("idx", idx);
			return "search_ok.jsp";
		}
	}
}
