package com.hb.model;

import java.util.Calendar;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mail.SendMail;
import com.hb.mybatis.Bind_VO;
import com.hb.mybatis.Cover_VO;
import com.hb.mybatis.Customer_VO;
import com.hb.mybatis.DAO;
import com.hb.mybatis.IP_VO;
import com.hb.mybatis.Order_VO;
import com.hb.mybatis.PF_VO;
import com.hb.mybatis.PT_VO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Comm_order implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRequestURI();
		System.out.println("주문 : "+path);
		if(path.substring(19,22).equals("Sen")){
			System.out.println("주문 준비");
			path = request.getSession().getServletContext().getRealPath("/upload");
			try {
				MultipartRequest mr = new MultipartRequest(
						request,
						path,
						1024*1024*1024,
						"utf-8",
						new DefaultFileRenamePolicy()
						);
				Order_VO ovo = new Order_VO();
				String c_idx = mr.getParameter("c_idx");
				ovo.setC_idx(c_idx);
				ovo.setCopy_num(Integer.parseInt(mr.getParameter("copy_num")));
				ovo.setPage_num(Integer.parseInt(mr.getParameter("page_num")));
				ovo.setPf_idx(mr.getParameter("pf_idx"));
				ovo.setPt_idx(mr.getParameter("pt_idx"));
				ovo.setIp_idx(mr.getParameter("ip_idx"));
				ovo.setInner_paper_num(Integer.parseInt(mr.getParameter("inner_paper_num")));
				ovo.setCover_idx(mr.getParameter("cover_idx"));
				ovo.setBind_idx(mr.getParameter("bind_idx"));
				ovo.setAddrnum(mr.getParameter("addrnum"));
				ovo.setAddr1(mr.getParameter("addr1"));
				ovo.setAddr2(mr.getParameter("addr2"));
				ovo.setO_rmks(mr.getParameter("o_rmks"));
				ovo.setPrice(Integer.parseInt(mr.getParameter("price")));
				ovo.setO_name(mr.getParameter("o_name"));
				if(DAO.getOrder(ovo) > 0){
					SendMail sm = new SendMail();
					Customer_VO cvo = DAO.getOneList(c_idx);
					String from = cvo.getC_email();
					System.out.println(request.getServletPath());
					String changedPath = path.replace("\\", "/");
					String filename = null;
					if(mr.getFilesystemName("up_file") != null){
						filename = changedPath+"/"+mr.getFilesystemName("up_file");
					}
					System.out.println(filename);
					int year = Calendar.getInstance().get(Calendar.YEAR);
					int month = Calendar.getInstance().get(Calendar.MONTH)+1;
					int date = Calendar.getInstance().get(Calendar.DATE);
					String title = "[주문]"+cvo.getC_name();
					String content = year+"."+month+"."+date+".\n"+cvo.getC_name()+"님 주문";
					sm.sendMail(from,title,content,filename);
				}else{
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String c_idx = ((Customer_VO)request.getSession().getAttribute("cvo")).getC_idx();
			List<Order_VO> ovoList = DAO.getOrderList(c_idx);
			request.getSession().setAttribute("ovoList", ovoList);
			return "/view/orderlist.jsp";
		}else if(path.substring(19,22).equals("Pag")){
			return "/view/orderinfo.jsp";
		}else{
			int copy_num = Integer.parseInt(request.getParameter("copy_num"));
			int page_num = Integer.parseInt(request.getParameter("page_num"));
			PF_VO pfvo = DAO.getPaperform(request.getParameter("pf_idx"));
			double pf_price = pfvo.getPf_price();
			PT_VO ptvo = DAO.getPrinting(request.getParameter("pt_idx"));
			int pt_price = ptvo.getPt_price();
			IP_VO ipvo = DAO.getInnerpaper(request.getParameter("ip_idx"));
			int ip_price = ipvo.getIp_price();
			int ip_num = Integer.parseInt(request.getParameter("inner_paper_num"));
			Cover_VO covervo = DAO.getCover(request.getParameter("cover_idx"));
			int cover_price = covervo.getCover_price();
			Bind_VO bindvo = DAO.getBind(request.getParameter("bind_idx"));
			int bind_price = bindvo.getBind_price();
			
			long total = ((long)(page_num*pf_price*pt_price)/10)*10;
			total = total + (ip_price*ip_num);
			total = total + cover_price + bind_price;
			total = total * copy_num;
			HttpSession session = request.getSession();
			session.setAttribute("pf_photo", pfvo.getPf_photo());
			session.setAttribute("ip_photo", ipvo.getIp_photo());
			session.setAttribute("cover_photo", covervo.getCover_photo());
			session.setAttribute("bind_photo", bindvo.getBind_photo());
			String output = "<h3>총액 "+total+"원</h3>";
			output += "<input type='hidden' value='"+total+"' name='price'/>";
			return output;
		}
	}
}
