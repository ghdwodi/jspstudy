package com.hb.mybatis;

public class BBS_VO {
	String b_idx,title,pwd,content,c_idx,b_date,b_category;
	int hit,groups,step,lev;
	public BBS_VO() {}
	public BBS_VO(String b_idx, String title, String pwd, String content, String c_idx, String b_date,
			String b_category, int hit, int groups, int step, int lev) {
		super();
		this.b_idx = b_idx;
		this.title = title;
		this.pwd = pwd;
		this.content = content;
		this.c_idx = c_idx;
		this.b_date = b_date;
		this.b_category = b_category;
		this.hit = hit;
		this.groups = groups;
		this.step = step;
		this.lev = lev;
	}
	public String getB_idx() {
		return b_idx;
	}
	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getC_idx() {
		return c_idx;
	}
	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGroups() {
		return groups;
	}
	public void setGroups(int groups) {
		this.groups = groups;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
}