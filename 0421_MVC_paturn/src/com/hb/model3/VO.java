package com.hb.model3;

public class VO {
	private String name,kor,eng,math,sum,avg,hak;
	public VO() {}
	public VO(String name, String kor, String eng, String math, String sum, String avg, String hak) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.sum = sum;
		this.avg = avg;
		this.hak = hak;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKor() {
		return kor;
	}
	public void setKor(String kor) {
		this.kor = kor;
	}
	public String getEng() {
		return eng;
	}
	public void setEng(String eng) {
		this.eng = eng;
	}
	public String getMath() {
		return math;
	}
	public void setMath(String math) {
		this.math = math;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getAvg() {
		return avg;
	}
	public void setAvg(String avg) {
		this.avg = avg;
	}
	public String getHak() {
		return hak;
	}
	public void setHak(String hak) {
		this.hak = hak;
	}
}
