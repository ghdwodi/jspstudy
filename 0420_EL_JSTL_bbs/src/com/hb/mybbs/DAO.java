package com.hb.mybbs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

// DB 관련된 모든 것을 DAO에서 처리한다.
public class DAO {
	private static SqlSession ss;
	
	// 싱글 턴 패턴 : 프로그램이 끝날 때까지 해당 객체는 하나로 유지한다.
	private synchronized static SqlSession getSql() {
		if(ss==null){
			ss = DBService.getFactory().openSession(false);
		}
		return ss;
	}
	public static int getTotalCount(){
		return getSql().selectOne("totalcount");
	}
	// 원글 list 처리 메소드
	public static List<BBS_VO> getList(Map<String, Integer> map){
		return getSql().selectList("list",map);
	}
	// 원글 삽입
	public static int getInsert(BBS_VO bvo){
		int res = getSql().insert("insert", bvo);
		ss.commit();
		return res;
	}
	// 원글 상세보기
	public static BBS_VO getOnelist(String b_idx){
		return getSql().selectOne("onelist", b_idx);
	}
	// 히트수 업데이트
	public static void getHit(BBS_VO bvo){
		getSql().insert("hit", bvo);
		ss.commit();
	}
	// 원글 업데이트
	public static int getUpdate(BBS_VO bvo){
		int res = getSql().update("update", bvo);
		ss.commit();
		return res;
	}
	// delete 메소드
	public static int getDelete(String idx){
		int result = getSql().delete("delete", idx);
		ss.commit();
		return result;
	}
	// 댓글 리스트
	public static List<Comm_VO> getCommList(String b_idx){
		return getSql().selectList("commlist",b_idx);
	}
	// 댓글 삽입
	public static int getCommentInsert(Comm_VO cvo){
		int res = getSql().insert("insertcomment", cvo);
		ss.commit();
		return res;
	}
	// 댓글 delete 메소드
	public static int getCommDelete(String c_idx){
		int result = getSql().delete("deletecomment", c_idx);
		ss.commit();
		return result;
	}
}