package com.hb.myshopingmall;

public class MemberVO {
	String memberidx,id,pwd,name,age,gender,email,photo,join_date;
	public MemberVO() {}
	public MemberVO(String memberidx, String id, String pwd, String name, String age, String gender, String email,
			String photo, String join_date) {
		super();
		this.memberidx = memberidx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.photo = photo;
		this.join_date = join_date;
	}
	public String getMemberidx() {
		return memberidx;
	}
	public void setMemberidx(String memberidx) {
		this.memberidx = memberidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
}
