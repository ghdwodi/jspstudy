package com.hb.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.myshopingmall.DAO;
import com.hb.myshopingmall.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Command_join implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response){
		if(request.getParameter("chk")==null){
			return "join.jsp";
		}else{
			int result = 0;
			String res = "false";
			try {
				String path = request.getServletContext().getRealPath("/upload/member/"+request.getParameter("path"));
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
				mvo.setId(mr.getParameter("id"));
				mvo.setPwd(mr.getParameter("pwd"));
				mvo.setName(mr.getParameter("name"));
				mvo.setAge(mr.getParameter("age"));
				mvo.setGender(mr.getParameter("gender"));
				
				if(mr.getFilesystemName("photo") != null){
					mvo.setPhoto(mr.getFilesystemName("photo"));
				}else{
					mvo.setPhoto("");
				}
				if(mr.getParameter("email") != null){
					mvo.setEmail(mr.getParameter("email"));
				}else{
					mvo.setEmail("");
				}
				result = DAO.getJoin(mvo);
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(result>0){
				res = "success";
			}
			return "join_chk.jsp?res="+res;
		}
	}
}
