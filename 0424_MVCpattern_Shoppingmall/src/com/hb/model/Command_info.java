package com.hb.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.myshopingmall.DAO;
import com.hb.myshopingmall.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Command_info implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String midx=null;
		if(request.getParameter("photo2")==null){
			return "memberinfo.jsp";
		}else{
			try {
				String path = request.getServletContext().getRealPath("/upload/member/"+request.getParameter("photo2"));
				File file = new File(path);
				file.mkdirs();
				MultipartRequest mr = new MultipartRequest(
							request,
							path,
							500*1024*1024,
							"utf-8",
							new DefaultFileRenamePolicy()
						);
				MemberVO mvo = new MemberVO();
				midx = mr.getParameter("memberidx");
				mvo.setMemberidx(midx);
				mvo.setName(mr.getParameter("name"));
				mvo.setAge(mr.getParameter("age"));
				mvo.setGender(mr.getParameter("gender"));
				
				if(mr.getFilesystemName("photo2") != null){
					mvo.setPhoto(mr.getFilesystemName("photo2"));
				}else{
					mvo.setPhoto(mr.getParameter("photo"));
				}
				if(mr.getParameter("email") != null){
					mvo.setEmail(mr.getParameter("email"));
				}else{
					mvo.setEmail("");
				}
				DAO.getUpdate(mvo);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			request.getSession().invalidate();
			request.getSession().setAttribute("mvo", DAO.getSelectOne(midx));
			if(DAO.getSelectOne(midx).getMemberidx().equals("0")){
				request.getSession().setAttribute("login_chk", 0);
			}else{
				request.getSession().setAttribute("login_chk", 1);
			}
			return "memberinfo.jsp";
		}
	}

}
