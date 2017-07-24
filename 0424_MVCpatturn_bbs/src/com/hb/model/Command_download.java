package com.hb.model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Command_download implements Command{
	@Override
	public String exac(HttpServletRequest request, HttpServletResponse response) {
		// jsp 출력 스트림과 servlet 출력 스트림 겹침 방지
		
		int b ;
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try{
			String f_name = request.getParameter("file_name");
			String encoded_f_name = URLEncoder.encode(f_name, "utf-8");
			// 실제 파일이 있는 경로
			String r_path = request.getServletContext().getRealPath("/upload");
			
			// 다운로드 받을 할 수 있도록 클라이언트의 문서 타입 변경
			response.setContentType("application/x-msdownload");
			
			// 클라이언트의 헤더 정보를 첨부파일이 있는 것 처럼 변경
			response.setHeader("Content-Disposition", "attachment;filename="+encoded_f_name);
			
			////////////////////// 실제 입출력 스트림 하기 ////////////////////////////
			///////////////////////반드시 바이트 스트림 //////////////////////////////
			File file = new File(r_path+"/"+encoded_f_name);
			
			if(file.isFile()){
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				bos = new BufferedOutputStream(response.getOutputStream());
				while((b=bis.read()) != -1){
					bos.write(b);
					bos.flush();
				}
			}
		}catch(Exception e){
		}finally{
			try{
				bos.close();
				bis.close();
				fis.close();
			}catch(Exception e){
			}
		}
		return "Control_bbs?cmd=view&b_idx="+request.getParameter("b_idx");
	}

}
