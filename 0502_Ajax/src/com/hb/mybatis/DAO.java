package com.hb.mybatis;
import java.util.List;

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
	
	public static List<VO> getList(){
		return getSql().selectList("list");
	}
	
	public static String getIdChk(String id){
		List<VO> one = getSql().selectList("onelist",id);
		String res = "사용 가능";
		if(one.size()>0){
			res = "사용 불가";
		}
		return res;
	}
	
	public static int getInsert(VO vo){
		int result = getSql().insert("insert",vo);
		ss.commit();
		return result;
	}
	
	public static int getDelete(String idx){
		int result = getSql().delete("delete", idx);
		ss.commit();
		return result;
	}
}
