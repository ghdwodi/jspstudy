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
	public static List<BoardVO> getList(Map<String,Integer> map){
		return getSql().selectList("list",map);
	}
	public static BoardVO getOneList(String seq){
		return getSql().selectOne("onelist", seq);
	}
	public static int getInsert(BoardVO bvo){
		int result = getSql().insert("insert", bvo);
		ss.commit();
		return result;
	}
	public static void getUp_lev(Map<String,Integer> map){
		getSql().update("up_lev", map);
		ss.commit();
	}
	public static int getInsertRewrite(BoardVO bvo){
		int result = getSql().insert("insertRewrite",bvo);
		ss.commit();
		return result;
	}
	public static void getHit(BoardVO bvo){
		getSql().update("hit", bvo);
		ss.commit();
	}
	public static int getModify(BoardVO bvo){
		int result = getSql().update("modify", bvo);
		ss.commit();
		return result;
	}
	public static int getDelete(String seq){
		int result = getSql().delete("delete",seq);
		ss.commit();
		return result;
	}
}