package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybatis.BBS_VO;
import com.hb.mybatis.DAO;
import com.hb.mybatis.Paging;

public class Comm_bbs implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cPage=null;
		String b_category=null;
		if(request.getParameter("cPage")==null){
			cPage="1";
		}else{
			cPage=request.getParameter("cPage");
		}
		if(request.getParameter("b_category")==null){
			b_category="0";
		}else{
			b_category=request.getParameter("b_category");
		}
		Paging p = new Paging(cPage,b_category);
		List<BBS_VO> bvoList = DAO.getBBSList(p.getMap());
		request.getSession().setAttribute("b_category", b_category);
		request.getSession().setAttribute("bvoList", bvoList);
		request.getSession().setAttribute("cPage", cPage);
		request.setAttribute("p", p);
		return "/view/bbs.jsp";
	}
}
