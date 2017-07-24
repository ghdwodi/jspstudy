package com.hb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybbs.BBS_VO;
import com.hb.mybbs.DAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Command_modifyOK implements Command{
	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		String b_idx=null;
		try {
			String path = request.getServletContext().getRealPath("/upload");
			MultipartRequest mr = new MultipartRequest(
						request,
						path,
						500*1024*1024,
						"utf-8",
						new DefaultFileRenamePolicy()
					);
			BBS_VO bvo = new BBS_VO();
			bvo.setB_idx(mr.getParameter("b_idx"));
			bvo.setSubject(mr.getParameter("subject"));
			bvo.setWriter(mr.getParameter("writer"));
			bvo.setContent(mr.getParameter("content"));
			b_idx = bvo.getB_idx();
			
			// 파일 처리
			if(mr.getFilesystemName("file_name") != null){
				bvo.setFile_name(mr.getFilesystemName("file_name"));
			}else{
				bvo.setFile_name("");
			}
			
			DAO.getUpdate(bvo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "Control_bbs?cmd=view&b_idx="+b_idx;
	}

}
