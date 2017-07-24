package com.hb.mybatis;

public class IP_VO {
	String ip_idx,inner_paper,ip_photo;
	int ip_price;
	public IP_VO() {}
	public IP_VO(String ip_idx, String inner_paper, String ip_photo, int ip_price) {
		super();
		this.ip_idx = ip_idx;
		this.inner_paper = inner_paper;
		this.ip_photo = ip_photo;
		this.ip_price = ip_price;
	}
	public String getIp_idx() {
		return ip_idx;
	}
	public void setIp_idx(String ip_idx) {
		this.ip_idx = ip_idx;
	}
	public String getInner_paper() {
		return inner_paper;
	}
	public void setInner_paper(String inner_paper) {
		this.inner_paper = inner_paper;
	}
	public String getIp_photo() {
		return ip_photo;
	}
	public void setIp_photo(String ip_photo) {
		this.ip_photo = ip_photo;
	}
	public int getIp_price() {
		return ip_price;
	}
	public void setIp_price(int ip_price) {
		this.ip_price = ip_price;
	}
}
