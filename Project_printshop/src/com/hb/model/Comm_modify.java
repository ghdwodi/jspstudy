package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Customer_VO;
import com.hb.mybatis.DAO;

public class Comm_modify implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRequestURI();
		System.out.println(path);
		if(path.substring(19,22).equals("Cus")){
			Customer_VO cvo = new Customer_VO();
			cvo.setC_idx(request.getParameter("c_idx"));
			cvo.setC_pw(request.getParameter("c_pw"));
			cvo.setC_name(request.getParameter("c_name"));
			cvo.setC_email(request.getParameter("c_email"));
			cvo.setC_addrnum(request.getParameter("c_addrnum"));
			cvo.setC_addr1(request.getParameter("c_addr1"));
			cvo.setC_addr2(request.getParameter("c_addr2"));
			if(DAO.getModify(cvo) > 0){
				request.getSession().setAttribute("cvo", DAO.getOneList(request.getParameter("c_idx")));
				return "수정 성공.";
			}else{
				request.getSession().setAttribute("cvo", DAO.getOneList(request.getParameter("c_idx")));
				return "수정 실패.";
			}
		}else{
			return "/view/modify.jsp";
		}
	}
}
