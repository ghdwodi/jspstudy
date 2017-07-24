package com.hb.mybatis;

public class Order_VO {
	String o_idx,c_idx,pf_idx,pt_idx,ip_idx,cover_idx,bind_idx,orderdate,addrnum,addr1,addr2,o_rmks,o_name;
	int copy_num,page_num,inner_paper_num,price;
	public Order_VO() {}
	public Order_VO(String o_idx, String c_idx, String pf_idx, String pt_idx, String ip_idx, String cover_idx,
			String bind_idx, String orderdate, String addrnum, String addr1, String addr2, int copy_num, int page_num,
			int inner_paper_num, int price, String o_rmks,String o_name) {
		super();
		this.o_idx = o_idx;
		this.c_idx = c_idx;
		this.pf_idx = pf_idx;
		this.pt_idx = pt_idx;
		this.ip_idx = ip_idx;
		this.cover_idx = cover_idx;
		this.bind_idx = bind_idx;
		this.orderdate = orderdate;
		this.addrnum = addrnum;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.copy_num = copy_num;
		this.page_num = page_num;
		this.inner_paper_num = inner_paper_num;
		this.price = price;
		this.o_rmks = o_rmks;
		this.o_name = o_name;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_rmks() {
		return o_rmks;
	}
	public void setO_rmks(String o_rmks) {
		this.o_rmks = o_rmks;
	}
	public String getO_idx() {
		return o_idx;
	}
	public void setO_idx(String o_idx) {
		this.o_idx = o_idx;
	}
	public String getC_idx() {
		return c_idx;
	}
	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}
	public String getPf_idx() {
		return pf_idx;
	}
	public void setPf_idx(String pf_idx) {
		this.pf_idx = pf_idx;
	}
	public String getPt_idx() {
		return pt_idx;
	}
	public void setPt_idx(String pt_idx) {
		this.pt_idx = pt_idx;
	}
	public String getIp_idx() {
		return ip_idx;
	}
	public void setIp_idx(String ip_idx) {
		this.ip_idx = ip_idx;
	}
	public String getCover_idx() {
		return cover_idx;
	}
	public void setCover_idx(String cover_idx) {
		this.cover_idx = cover_idx;
	}
	public String getBind_idx() {
		return bind_idx;
	}
	public void setBind_idx(String bind_idx) {
		this.bind_idx = bind_idx;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getAddrnum() {
		return addrnum;
	}
	public void setAddrnum(String addrnum) {
		this.addrnum = addrnum;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getCopy_num() {
		return copy_num;
	}
	public void setCopy_num(int copy_num) {
		this.copy_num = copy_num;
	}
	public int getPage_num() {
		return page_num;
	}
	public void setPage_num(int page_num) {
		this.page_num = page_num;
	}
	public int getInner_paper_num() {
		return inner_paper_num;
	}
	public void setInner_paper_num(int inner_paper_num) {
		this.inner_paper_num = inner_paper_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
