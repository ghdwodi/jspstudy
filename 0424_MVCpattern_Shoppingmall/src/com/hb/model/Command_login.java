package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.myshopingmall.DAO;
import com.hb.myshopingmall.MemberVO;

public class Command_login implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		if(request.getParameter("chk")==null){
			return "login.jsp";
		}else if(request.getParameter("chk").equals("logined")){
			return "memberpage.jsp";
		}else{
			HttpSession session = request.getSession();
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			MemberVO mvo = new MemberVO();
			mvo.setId(id); mvo.setPwd(pwd);
			if(DAO.getLogin(mvo)==null){
				return "login_fail.jsp";
			}else{
				session.setAttribute("mvo", DAO.getLogin(mvo));
				if(DAO.getLogin(mvo).getMemberidx().equals("0")){
					session.setAttribute("login_chk", 0);
				}else{
					session.setAttribute("login_chk", 1);
				}
				return "memberpage.jsp";
			}
		}
	}
}
