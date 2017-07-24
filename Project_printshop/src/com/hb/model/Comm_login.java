package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybatis.Customer_VO;
import com.hb.mybatis.DAO;

public class Comm_login implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRequestURI();
		System.out.println(path);
		if(path.substring(19,22).equals("Cus")){
			Customer_VO cvo = new Customer_VO();
			cvo.setC_id(request.getParameter("id"));
			cvo.setC_pw(request.getParameter("pwd"));
			if(DAO.getLogin(cvo).size()==0){
				return "회원정보가 없습니다.";
			}else{
				HttpSession session = request.getSession();
				cvo = DAO.getLogin(cvo).get(0);
				String c_idx = cvo.getC_idx();
//				session.invalidate();
				session.setAttribute("cvo", cvo);
				if(c_idx.equals("0")){
					session.setAttribute("loginchk", 0);
				}else{
					session.setAttribute("loginchk", 1);
				}
				return "로그인 성공";
			}
		}else{
			return "/view/login.jsp";
		}
	}
}
