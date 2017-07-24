package com.hb.mybatis;

public class PT_VO {
	String pt_idx,printing,pt_photo;
	int pt_price;
	public PT_VO() {}
	public PT_VO(String pt_idx, String printing, String pt_photo, int pt_price) {
		super();
		this.pt_idx = pt_idx;
		this.printing = printing;
		this.pt_photo = pt_photo;
		this.pt_price = pt_price;
	}
	public String getPt_idx() {
		return pt_idx;
	}
	public void setPt_idx(String pt_idx) {
		this.pt_idx = pt_idx;
	}
	public String getPrinting() {
		return printing;
	}
	public void setPrinting(String printing) {
		this.printing = printing;
	}
	public String getPt_photo() {
		return pt_photo;
	}
	public void setPt_photo(String pt_photo) {
		this.pt_photo = pt_photo;
	}
	public int getPt_price() {
		return pt_price;
	}
	public void setPt_price(int pt_price) {
		this.pt_price = pt_price;
	}
}
