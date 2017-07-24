package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;

public class Comm_order_img implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String output = "<table>";
		output += "<tr><th>용지</th><th>간지/속지</th></tr>";
		String pfphoto = "<img src='/Project_printshop/img/images/paperform/"+DAO.getPaperform(request.getParameter("pf_idx")).getPf_photo()+"'/>";
		String ipphoto = "<img src='/Project_printshop/img/images/innerpaper/"+DAO.getInnerpaper(request.getParameter("ip_idx")).getIp_photo()+"'/>";
		String coverphoto = "<img src='/Project_printshop/img/images/cover/"+DAO.getCover(request.getParameter("cover_idx")).getCover_photo()+"'/>";
		String bindphoto = "<img src='/Project_printshop/img/images/bind/"+DAO.getBind(request.getParameter("bind_idx")).getBind_photo()+"'/>";
		output += "<tr><td>"+pfphoto+"</td><td>"+ipphoto+"</td></tr>";
		output += "<tr><th>표지</th><th>제본</th></tr>";
		output += "<tr><td>"+coverphoto+"</td><td>"+bindphoto+"</td></tr>";
		output += "</table>";
		return output;
	}
}
