package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.myguestbook.DAO;
import com.hb.myguestbook.VO;

public class Dept_OkCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String deptno = request.getParameter("deptno");
		List<VO> deptList = DAO.getDept(deptno);
		request.setAttribute("deptList", deptList);
		return "dept_ok.jsp";
	}

}
