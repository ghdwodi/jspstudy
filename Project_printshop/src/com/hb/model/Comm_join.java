package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Customer_VO;
import com.hb.mybatis.DAO;

public class Comm_join implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRequestURI();
		if(path.substring(19,22).equals("Cus")){
			Customer_VO cvo = new Customer_VO();
			cvo.setC_id(request.getParameter("c_id"));
			cvo.setC_pw(request.getParameter("c_pw"));
			cvo.setC_name(request.getParameter("c_name"));
			cvo.setC_email(request.getParameter("c_email"));
			cvo.setC_addrnum(request.getParameter("c_addrnum"));
			cvo.setC_addr1(request.getParameter("c_addr1"));
			cvo.setC_addr2(request.getParameter("c_addr2"));
			if(DAO.getJoin(cvo) > 0){
				return "가입 성공.";
			}else{
				return "가입 실패.";
			}
		}else{
			return "/view/join.jsp";
		}
	}
}
