package com.hb.mybatis;

import java.util.HashMap;
import java.util.Map;

public class Paging {
	int b_category;		// 게시판 종류
	int nowPage;		// 현재 페이지
	int nowBlock;		// 현재 블록
	int totalRecord;	// 총 게시물의 수
	int numPerPage;		// 한 페이지에 게시되는 글의 수
	int pagePerBlock;	// 블록당 표현되는 페이지 수
	int totalPage;		// 전체 페이지 수
	int totalBlock;		// 전체 블록의 수
	int begin;			// 시작 번호
	int end;			// 끝 번호
	int beginPage;
	int endPage;
	Map<String,Integer> map;	// DB처리를 위한 Map
	
	public Paging(String cPage, String b_category) {
		this.b_category = Integer.parseInt(b_category);
		nowPage = 1;
		if(cPage!=null){
			nowPage = Integer.parseInt(cPage);
		}
		nowBlock = 1;
		totalRecord = DAO.getTotalCount(b_category);
		numPerPage = 10;
		pagePerBlock = 10;
		totalPage = totalRecord/numPerPage;
		if(totalRecord%numPerPage!=0) totalPage++;
		begin = (nowPage-1)*numPerPage+1;
		end = (begin-1)+numPerPage;
		map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("b_category",this.b_category);
		beginPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		endPage = beginPage+pagePerBlock-1;
		if(endPage>totalPage) endPage=totalPage;
	}
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginPage() {
		return beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public Map<String, Integer> getMap() {
		return map;
	}
	public void setMap(Map<String, Integer> map) {
		this.map = map;
	}
	public int getB_category() {
		return b_category;
	}
	public void setB_category(int b_category) {
		this.b_category = b_category;
	}
}