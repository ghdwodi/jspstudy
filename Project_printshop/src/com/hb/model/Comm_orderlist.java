package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Customer_VO;
import com.hb.mybatis.DAO;
import com.hb.mybatis.Order_VO;

public class Comm_orderlist implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRequestURI();
		if(path.substring(19,22).equals("Cus")){
			String o_idx = request.getParameter("o_idx");
			Order_VO ovo = DAO.getOrderInfo(o_idx);
			String output = "<table class='o_table'><tbody>";
			output += "<tr><td>주문자</td><td>"+ovo.getO_name()+"</td></tr>";
			output += "<tr><td>매수</td><td>"
					+DAO.getPaperform(ovo.getPf_idx()).getPaper_form()
					+" "+ovo.getPage_num()+"장</td></tr>";
			output += "<tr><td>인쇄방식</td><td>"
					+DAO.getPrinting(ovo.getPt_idx()).getPrinting()+"</td></tr>";
			output += "<tr><td>간지,속지</td><td>"
					+DAO.getInnerpaper(ovo.getIp_idx()).getInner_paper()
					+" "+ovo.getInner_paper_num()
					+"장</td></tr>";
			output += "<tr><td>표지</td><td>"
					+DAO.getCover(ovo.getCover_idx()).getCover()+"</td></tr>";
			output += "<tr><td>제본</td><td>"
					+DAO.getBind(ovo.getBind_idx()).getBind()+"</td></tr>";
			output += "<tr><td>부수</td><td>"+ovo.getCopy_num()+"부</td></tr>";
			output += "<tr><td>주소</td><td>"+ovo.getAddr1()+","+ovo.getAddr2()+"</td></tr>";
			output += "<tr><td>특이사항</td><td>"+ovo.getO_rmks()+"</td></tr>";
			output += "</tbody></table>";
			return output;
		}else{
			if(request.getSession().getAttribute("loginchk")!=null){
				String c_idx = ((Customer_VO)request.getSession().getAttribute("cvo")).getC_idx();
				List<Order_VO> ovoList = DAO.getOrderList(c_idx);
				request.getSession().setAttribute("ovoList", ovoList);
			}
			return "/view/orderlist.jsp";
		}
	}
}
