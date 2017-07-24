package com.hb.model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HiComm implements Comm {
	// 요청기능을 수행하는 메소드
	// 리턴은 뷰의 이름(jsp이름)
	@Override
	public void exec(HttpServletRequest request, HttpServletResponse response) {
		String name = "홍길동";
		int age = 17;
		request.setAttribute("name", name);
		request.setAttribute("age", age);
	}
}