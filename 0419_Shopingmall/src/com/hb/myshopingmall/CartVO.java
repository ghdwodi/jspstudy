package com.hb.myshopingmall;

public class CartVO {
	String cartidx,memberidx,num,cart_date;
	int productnum;
	public CartVO() {}
	public CartVO(String cartidx, String memberidx, String num, String cart_date, int productnum) {
		super();
		this.cartidx = cartidx;
		this.memberidx = memberidx;
		this.num = num;
		this.cart_date = cart_date;
		this.productnum = productnum;
	}
	public String getCartidx() {
		return cartidx;
	}
	public void setCartidx(String cartidx) {
		this.cartidx = cartidx;
	}
	public String getMemberidx() {
		return memberidx;
	}
	public void setMemberidx(String memberidx) {
		this.memberidx = memberidx;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getCart_date() {
		return cart_date;
	}
	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
}
