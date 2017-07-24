package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Comm_myPage implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "/view/mypage.jsp";
	}
}
