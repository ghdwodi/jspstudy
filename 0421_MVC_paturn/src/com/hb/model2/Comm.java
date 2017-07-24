package com.hb.model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Comm {
	public void exec(HttpServletRequest request, HttpServletResponse response);
}