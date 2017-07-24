package com.hb.model3;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyCommand {
	public String exec(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		int sum = kor+eng+math;
		double avg = sum/3.0;
		String hak=null;
		if(avg>=90){
			hak="A학점";
		}else if(avg>=80){
			hak="B학점";
		}else if(avg>=70){
			hak="C학점";
		}else if(avg>=60){
			hak="D학점";
		}else{
			hak="F학점";
		}

		// 방법1 : request, session의 속성을 이용하는 법
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("sum", sum);
		session.setAttribute("avg", avg);
		session.setAttribute("hak", hak);
		
		// 방법2 : VO를 이용
		VO vo = new VO();
		vo.setName(name);
		vo.setSum(String.valueOf(sum));
		vo.setAvg(String.valueOf(avg));
		vo.setHak(hak);
		session.setAttribute("vo", vo);
		
		// 방법3 : Map을 이용 (단 같은 자료형이어야 가능)
		Map<String, String> map = new HashMap<>();
		map.put("name",name);
		map.put("sum",String.valueOf(sum));
		map.put("avg",String.valueOf(avg));
		map.put("hak",hak);
		session.setAttribute("map", map);

		// 방법3 : Map을 이용 (다른 자료형일 때)
		Map<Object,Object> map2 = new HashMap<>();
		map2.put("name", name);
		map2.put("sum", sum);
		map2.put("avg", avg);
		map2.put("hak", hak);
		session.setAttribute("map2", map2);
		
		return "view04/output.jsp";
	}
}