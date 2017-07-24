package com.hb.mybatis;

public class PF_VO {
	String pf_idx,paper_form,pf_photo;
	double pf_price;
	public PF_VO() {}
	public PF_VO(String pf_idx, String paper_form, String pf_photo, double pf_price) {
		super();
		this.pf_idx = pf_idx;
		this.paper_form = paper_form;
		this.pf_photo = pf_photo;
		this.pf_price = pf_price;
	}
	public String getPf_idx() {
		return pf_idx;
	}
	public void setPf_idx(String pf_idx) {
		this.pf_idx = pf_idx;
	}
	public String getPaper_form() {
		return paper_form;
	}
	public void setPaper_form(String paper_form) {
		this.paper_form = paper_form;
	}
	public String getPf_photo() {
		return pf_photo;
	}
	public void setPf_photo(String pf_photo) {
		this.pf_photo = pf_photo;
	}
	public double getPf_price() {
		return pf_price;
	}
	public void setPf_price(double pf_price) {
		this.pf_price = pf_price;
	}
}
