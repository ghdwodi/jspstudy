package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybbs.BBS_VO;
import com.hb.mybbs.Comm_VO;
import com.hb.mybbs.DAO;

public class Command_view implements Command{
	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		BBS_VO bvo = DAO.getOnelist(b_idx);
		// 히트수
		int hit = Integer.parseInt(bvo.getHit())+1;
		bvo.setHit(String.valueOf(hit));
		
		// 히트수를 DB에 업데이트
		DAO.getHit(bvo);
		
		// 수정, 삭제를 위해 세션에 bvo 저장
		HttpSession session = request.getSession();
		session.setAttribute("bvo", bvo);
		
		// 댓글 가져오기
		List<Comm_VO> commList = DAO.getCommList(b_idx);
		request.setAttribute("commList", commList);
		
		return "view.jsp";
	}
}
