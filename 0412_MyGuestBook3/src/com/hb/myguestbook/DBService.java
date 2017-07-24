package com.hb.myguestbook;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {
	static private SqlSessionFactory factory;
	// static 초기화
	static{
		try {
			factory = new SqlSessionFactoryBuilder().build(
						Resources.getResourceAsReader("com/hb/myguestbook/config.xml"));
		} catch (Exception e) {
		}
	}
	public static SqlSessionFactory getFactory(){
		return factory;
	}
}