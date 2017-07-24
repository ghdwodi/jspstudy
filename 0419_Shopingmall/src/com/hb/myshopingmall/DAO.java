package com.hb.myshopingmall;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

// DB 관련된 모든 것을 DAO에서 처리한다.
public class DAO {
	private static SqlSession ss;
	private static List<ProductVO> plist;
	
	// 싱글 턴 패턴 : 프로그램이 끝날 때까지 해당 객체는 하나로 유지한다.
	private synchronized static SqlSession getSql() {
		if(ss==null){
			ss = DBService.getFactory().openSession(false);
		}
		return ss;
	}
	
	// 쇼핑몰
	public static List<ProductVO> getList(String category){
		plist = getSql().selectList("list",category);
		return plist;
	}
	public static ProductVO findProduct(String num){
		ProductVO pvo = null;
		for(ProductVO k : plist){
			if(k.getNum()==Integer.parseInt(num)){
				pvo = k;
			}
		}
		return pvo;
	}
	public static int getEnroll(ProductVO pvo){
		int result = getSql().insert("enroll", pvo);
		ss.commit();
		return result;
	}
	
	// 회원
	public static MemberVO getLogin(MemberVO mvo){
		return getSql().selectOne("login", mvo);
	}
	public static int getJoin(MemberVO mvo){
		int result = getSql().insert("join", mvo);
		ss.commit();
		return result;
	}
	public static int getUpdate(MemberVO mvo){
		int result = getSql().update("update", mvo);
		ss.commit();
		return result;
	}
	
	// 장바구니
	public static List<CartVO> getCartlist(String memberidx){
		return getSql().selectList("cartlist", memberidx);
	}
	public static int getAddincart(CartVO cvo){
		int result = getSql().insert("addincart", cvo);
		ss.commit();
		return result;
	}
	public static int getAddproduct(String productnum){
		int result = getSql().update("addproduct", productnum);
		ss.commit();
		return result;
	}
}