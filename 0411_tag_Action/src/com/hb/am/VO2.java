package com.hb.am;

public class VO2 {
	private String name,age,addr,gender,addr2;
	private String[] hobby,play;

	public VO2(){}
	
	public VO2(String name, String age, String addr, String gender, String addr2, String[] hobby, String[] play) {
		super();
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.gender = gender;
		this.addr2 = addr2;
		this.hobby = hobby;
		this.play = play;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public String[] getPlay() {
		return play;
	}

	public void setPlay(String[] play) {
		this.play = play;
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
}
