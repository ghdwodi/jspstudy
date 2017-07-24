package com.hb.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.myshopingmall.DAO;
import com.hb.myshopingmall.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Command_enroll implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		if(request.getParameter("chk")==null){
			return "enrollproduct.jsp";
		}else{
			try {
				String path = request.getServletContext().getRealPath("/upload/product_photo/"+request.getParameter("p_num"));
				File file = new File(path);
				file.mkdirs();
				MultipartRequest mr = new MultipartRequest(
							request,
							path,
							500*1024*1024,
							"utf-8",
							new DefaultFileRenamePolicy()
						);
				ProductVO pvo = new ProductVO();
				pvo.setCategory(mr.getParameter("category"));
				pvo.setP_num(mr.getParameter("p_num"));
				pvo.setP_name(mr.getParameter("p_name"));
				pvo.setP_company(mr.getParameter("p_company"));
				pvo.setP_price(Integer.parseInt(mr.getParameter("p_price")));
				pvo.setP_saleprice(Integer.parseInt(mr.getParameter("p_saleprice")));
				pvo.setP_content(mr.getParameter("p_content"));
				
				if(mr.getFilesystemName("p_image_s") != null){
					pvo.setP_image_s(mr.getFilesystemName("p_image_s"));
				}else{
					pvo.setP_image_s("");
				}
				if(mr.getFilesystemName("p_image_l") != null){
					pvo.setP_image_l(mr.getFilesystemName("p_image_l"));
				}else{
					pvo.setP_image_l("");
				}
				DAO.getEnroll(pvo);
			} catch (Exception e) {
				// TODO: handle exception
			}
			return "enrollproduct.jsp";
		}
	}
}
