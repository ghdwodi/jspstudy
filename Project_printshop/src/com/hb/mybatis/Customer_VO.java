package com.hb.mybatis;

public class Customer_VO {
	String c_idx,c_id,c_pw,c_name,c_email,c_addrnum,c_addr1,c_addr2,c_date;
	public Customer_VO() {}
	public Customer_VO(String c_idx, String c_id, String c_pw, String c_name, String c_email, String c_addrnum,
			String c_addr1, String c_addr2, String c_date) {
		super();
		this.c_idx = c_idx;
		this.c_id = c_id;
		this.c_pw = c_pw;
		this.c_name = c_name;
		this.c_email = c_email;
		this.c_addrnum = c_addrnum;
		this.c_addr1 = c_addr1;
		this.c_addr2 = c_addr2;
		this.c_date = c_date;
	}
	public String getC_idx() {
		return c_idx;
	}
	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_pw() {
		return c_pw;
	}
	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_addrnum() {
		return c_addrnum;
	}
	public void setC_addrnum(String c_addrnum) {
		this.c_addrnum = c_addrnum;
	}
	public String getC_addr1() {
		return c_addr1;
	}
	public void setC_addr1(String c_addr1) {
		this.c_addr1 = c_addr1;
	}
	public String getC_addr2() {
		return c_addr2;
	}
	public void setC_addr2(String c_addr2) {
		this.c_addr2 = c_addr2;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
}
