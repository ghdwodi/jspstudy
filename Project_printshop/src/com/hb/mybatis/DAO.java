package com.hb.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class DAO {
private static SqlSession ss;
	
	// 싱글 턴 패턴 : 프로그램이 끝날 때까지 해당 객체는 하나로 유지한다.
	private synchronized static SqlSession getSql() {
		if(ss==null){
			ss = DBService.getFactory().openSession();
		}
		return ss;
	}
	
	/////////// 고객 관련 ///////////
	// 로그인
	public static List<Customer_VO> getLogin(Customer_VO cvo){
		return getSql().selectList("login", cvo);
	}
	// 중복ID체크
	public static String getIdChk(String c_id){
		List<Customer_VO> one = getSql().selectList("idcheck",c_id);
		String res = "사용 가능";
		if(one.size()>0){
			res = "사용 불가";
		}
		return res;
	}
	// 회원가입
	public static int getJoin(Customer_VO cvo){
		int result = getSql().insert("join",cvo);
		ss.commit();
		return result;
	}
	// 회원정보 조회
	public static Customer_VO getOneList(String c_idx){
		return getSql().selectOne("onelist", c_idx);
	}
	// 회원정보 수정
	public static int getModify(Customer_VO cvo){
		int result = getSql().update("modify", cvo);
		ss.commit();
		return result;
	}
	
	/////////// 게시판 관련 ///////////
	// 게시판 총 게시물 수
	public static int getTotalCount(String b_category){
		return getSql().selectOne("totalcount",b_category);
	}
	// 게시물 리스트 표시
	public static List<BBS_VO> getBBSList(Map<String, Integer> map){
		return getSql().selectList("bbslist",map);
	}
	// 게시물 리스트 요약
	public static List<BBS_VO> getBBSHeadList(String b_category){
		return getSql().selectList("bbshead",b_category);
	}
	// 글쓴이 표시
	public static String getWriter(String c_idx){
		return getSql().selectOne("writer", c_idx);
	}
	// 글 열람
	public static BBS_VO getOneBBSList(String b_idx){
		return getSql().selectOne("onebbslist",b_idx);
	}
	// 히트수 업데이트
	public static int getHit(BBS_VO bvo){
		int result = getSql().update("hit", bvo);
		ss.commit();
		return result; 
	}
	// 글쓰기
	public static int getWrite(BBS_VO bvo){
		int result = getSql().insert("write", bvo);
		ss.commit();
		return result; 
	}
	// 답변 작성 시 lev 업데이트
	public static int getUp_lev(int groups, int lev){
		Map<String,Integer> map = new HashMap<>();
		map.put("groups", groups);
		map.put("lev", lev);
		int result = getSql().update("up_lev",map);
		ss.commit();
		return result;
	}
	// 답변 작성
	public static int getInsertReply(BBS_VO bvo){
		int result = getSql().insert("insertreply", bvo);
		ss.commit();
		return result; 
	}
	// 글 수정
	public static int getBBSModify(BBS_VO bvo){
		int result = getSql().update("bbsmodify", bvo);
		ss.commit();
		return result; 
	}
	// 글 삭제
	public static int getBBSDelete(String b_idx){
		int result = getSql().delete("bbsdelete", b_idx);
		ss.commit();
		return result; 
	}

	/////////// 주문 관련 ///////////
	// 주문
	public static int getOrder(Order_VO ovo){
		int result = getSql().insert("order", ovo);
		ss.commit();
		return result;
	}
	// 주문내역 조회
	public static List<Order_VO> getOrderList(String c_idx){
		return getSql().selectList("orderlist", c_idx);
	}
	// 주문 조회
	public static Order_VO getOrderInfo(String o_idx){
		return getSql().selectOne("orderinfo", o_idx);
	}
	// 주문 삭제
	public static void getDeleteOrder(String o_idx){
		getSql().delete("deleteorder",o_idx);
		ss.commit();
	}
	// 각 주문속성 리스트 반환
	public static List<PF_VO> getPaperformList(){
		return getSql().selectList("pflist");
	}
	public static List<PT_VO> getPrintingList(){
		return getSql().selectList("ptlist");
	}
	public static List<IP_VO> getInnerpaperList(){
		return getSql().selectList("iplist");
	}
	public static List<Cover_VO> getCoverList(){
		return getSql().selectList("coverlist");
	}
	public static List<Bind_VO> getBindList(){
		return getSql().selectList("bindlist");
	}
	// 각 주문속성 반환
	public static PF_VO getPaperform(String pf_idx){
		return getSql().selectOne("pfprice",pf_idx);
	}
	public static PT_VO getPrinting(String pt_idx){
		return getSql().selectOne("ptprice", pt_idx);
	}
	public static IP_VO getInnerpaper(String ip_idx){
		return getSql().selectOne("ipprice", ip_idx);
	}
	public static Cover_VO getCover(String cover_idx){
		return getSql().selectOne("coverprice", cover_idx);
	}
	public static Bind_VO getBind(String bind_idx){
		return getSql().selectOne("bindprice", bind_idx);
	}
}