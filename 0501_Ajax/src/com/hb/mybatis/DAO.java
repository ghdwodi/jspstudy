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
}
