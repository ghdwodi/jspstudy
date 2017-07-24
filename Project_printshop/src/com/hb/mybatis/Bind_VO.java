package com.hb.mybatis;

public class Bind_VO {
	String bind_idx,bind,bind_photo;
	int bind_price;
	public Bind_VO() {}
	public Bind_VO(String bind_idx, String bind, String bind_photo, int bind_price) {
		super();
		this.bind_idx = bind_idx;
		this.bind = bind;
		this.bind_photo = bind_photo;
		this.bind_price = bind_price;
	}
	public String getBind_idx() {
		return bind_idx;
	}
	public void setBind_idx(String bind_idx) {
		this.bind_idx = bind_idx;
	}
	public String getBind() {
		return bind;
	}
	public void setBind(String bind) {
		this.bind = bind;
	}
	public String getBind_photo() {
		return bind_photo;
	}
	public void setBind_photo(String bind_photo) {
		this.bind_photo = bind_photo;
	}
	public int getBind_price() {
		return bind_price;
	}
	public void setBind_price(int bind_price) {
		this.bind_price = bind_price;
	}
}
