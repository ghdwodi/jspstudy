package com.hb.myguestbook;


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
	public static List<VO> getList(){
		return getSql().selectList("list");
	}
	public static List<VO> getDept(String deptno){
		return getSql().selectList("dept", deptno);
	}
	
	// 동적 쿼리
	public static List<VO> getSearch(Map<String, String> map){
		return getSql().selectList("keylist", map);
	}
}
