package com.hb.model;


import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WeatherCommand2 implements Command{
	StringBuffer sb = new StringBuffer();
	InputStream is = null;
	URL url = null;
	HttpURLConnection conn = null;
	BufferedReader br = null;
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String msg = "";
		try {
			// 웹상의 json 가져와서 파싱하기
			url = new URL("http://www.kma.go.kr/XML/weather/sfc_web_map.xml");
			conn = (HttpURLConnection)url.openConnection();
			is = conn.getInputStream();
			br = new BufferedReader(new InputStreamReader(is));
			while((msg=br.readLine())!=null){
				sb.append(msg);
			}
		} catch (Exception e) {
		}finally {
			try {
				br.close();
				is.close();
			} catch (Exception e2) {
			}
		}
		return sb.toString();
	}
}
