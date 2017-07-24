package com.hb.model;


import java.io.InputStream;
import java.net.URL;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;


public class WeatherCommand implements Command{
	InputStream is = null;
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String result = "";
		try {
			// 웹상의 xml 가져와서 파싱하기
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbFactory.newDocumentBuilder();
			URL url = new URL("http://www.kma.go.kr/XML/weather/sfc_web_map.xml");
			is = url.openStream();
			Document document = db.parse(is);

			// xml문서 파싱
			NodeList local = document.getElementsByTagName("local");
			for (int i = 0; i < local.getLength(); i++) {
				result += local.item(i).getFirstChild().getNodeValue()+","+
				((Element)(local.item(i))).getAttribute("ta")+","+
				((Element)(local.item(i))).getAttribute("desc")+"/";
			}
			result = result.substring(0, result.length()-1);
		} catch (Exception e) {
		}finally {
			try {
				is.close();
			} catch (Exception e2) {
			}
		}
		return result;
	}
}
