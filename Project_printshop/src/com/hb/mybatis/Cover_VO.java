package com.hb.mybatis;

public class Cover_VO {
	String cover_idx,cover,cover_photo;
	int cover_price;
	public Cover_VO() {}
	public Cover_VO(String cover_idx, String cover, String cover_photo, int cover_price) {
		super();
		this.cover_idx = cover_idx;
		this.cover = cover;
		this.cover_photo = cover_photo;
		this.cover_price = cover_price;
	}
	public String getCover_idx() {
		return cover_idx;
	}
	public void setCover_idx(String cover_idx) {
		this.cover_idx = cover_idx;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getCover_photo() {
		return cover_photo;
	}
	public void setCover_photo(String cover_photo) {
		this.cover_photo = cover_photo;
	}
	public int getCover_price() {
		return cover_price;
	}
	public void setCover_price(int cover_price) {
		this.cover_price = cover_price;
	}
}
