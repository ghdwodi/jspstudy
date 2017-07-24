package com.hb.mybbs;

public class BoardVO {
	private String seq,writer,title,content,pwd,hit,groups,step,lev,bname,regdate,filename,ip;
	public BoardVO() {}
	public BoardVO(String seq, String writer, String title, String content, String pwd, String hit, String groups,
			String step, String lev, String bname, String regdate, String filename, String ip) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.pwd = pwd;
		this.hit = hit;
		this.groups = groups;
		this.step = step;
		this.lev = lev;
		this.bname = bname;
		this.regdate = regdate;
		this.filename = filename;
		this.ip = ip;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getGroups() {
		return groups;
	}
	public void setGroups(String groups) {
		this.groups = groups;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getLev() {
		return lev;
	}
	public void setLev(String lev) {
		this.lev = lev;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
