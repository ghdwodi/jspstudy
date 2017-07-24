package com.hb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.model.Comm_bbs;
import com.hb.model.Comm_bbs_modify;
import com.hb.model.Comm_bbs_write;
import com.hb.model.Comm_bbs_writereply;
import com.hb.model.Comm_orderlist;
import com.hb.model.Comm_intro;
import com.hb.model.Comm_join;
import com.hb.model.Comm_login;
import com.hb.model.Comm_logout;
import com.hb.model.Comm_main;
import com.hb.model.Comm_modify;
import com.hb.model.Comm_myPage;
import com.hb.model.Comm_order;
import com.hb.model.Comm_orderpage;
import com.hb.model.Comm_viewbbs;
import com.hb.model.Comm_orderguide;
import com.hb.model.Command;

@WebServlet("/Page_cont")
public class Page_cont extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Page_cont() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		PrintWriter out = response.getWriter();
		System.out.println(request.getRequestURI());
		Command comm = null;
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		if(cmd.equals("main")){				// 메인 페이지
			comm = new Comm_main();
		}else if(cmd.equals("intro")){		// 회사소개
			comm = new Comm_intro();
		}else if(cmd.equals("orderguide")){	// 주문안내
			comm = new Comm_orderguide();
		}else if(cmd.equals("orderpage")){	// 주문페이지
			comm = new Comm_orderpage();
		}else if(cmd.equals("bbs")){		// 게시판
			comm = new Comm_bbs();
		}else if(cmd.equals("bbsview")){	// 게시판 열람
			comm = new Comm_viewbbs();
		}else if(cmd.equals("join")){		// 회원가입
			comm = new Comm_join();
		}else if(cmd.equals("login")){		// 로그인페이지
			comm = new Comm_login();
		}else if(cmd.equals("mypage")){		// 개인정보 페이지
			comm = new Comm_myPage();
		}else if(cmd.equals("modify")){		// 개인정보 수정 페이지
			comm = new Comm_modify();
		}else if(cmd.equals("logout")){		// 로그아웃
			comm = new Comm_logout();
		}else if(cmd.equals("order")){		// 주문확인
			comm = new Comm_order();
		}else if(cmd.equals("orderlist")){	// 장바구니
			comm = new Comm_orderlist();
		}else if(cmd.equals("write")){		// 글쓰기 페이지
			comm = new Comm_bbs_write();
		}else if(cmd.equals("reply")){		// 답글쓰기 페이지
			comm = new Comm_bbs_writereply();
		}else if(cmd.equals("bbsmodify")){	// 글 수정 페이지
			comm = new Comm_bbs_modify();
		}
		
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		if(request.getSession().getAttribute("loginchk")!=null){
			System.out.println("로그인체커 : "+(int)request.getSession().getAttribute("loginchk"));
		}
	}
}
