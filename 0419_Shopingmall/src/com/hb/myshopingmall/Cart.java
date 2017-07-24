package com.hb.myshopingmall;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<ProductVO> plist;	// 카트에 담을 제품리스트
	private int total;		// 카트에 담긴 제품 전체금액
	public Cart() {
		plist = new ArrayList<>();
	}
	
	// 카트에 해당 제품이 있는지 검사
	public ProductVO findCartProduct(String p_num){
		ProductVO pvo = null;
		for(ProductVO k : plist){
			if(k.getNum()==Integer.parseInt(p_num)){
				pvo = k;
			}
		}
		return pvo;
	}
	
	// 카트에 제품 추가
	public void addProduct(String num){
		ProductVO pvo = findCartProduct(num);
		// 카트에 해당 제품이 있는지 검사해서
		if(pvo==null){
			pvo=DAO.findProduct(num);
			pvo.setQuant(1);
			total = total + pvo.getP_saleprice();
			plist.add(pvo);	// 없으면 카트에 담고
		}else{
			pvo.setQuant(pvo.getQuant()+1);	// 있으면 수량만 추가
			total = total + pvo.getP_saleprice();
		}
	}
	
	// 카트에서 제품 삭제
	public void deleteProduct(String p_num){
		ProductVO pvo = findCartProduct(p_num);
		// 카트에 해당 제품이 있는지 검사해서
		if(pvo!=null){		// 있으면 삭제
			plist.remove(pvo);
			total = total - pvo.getP_saleprice();
		}
	}
	
	// 수량을 받아 변경하는 메소드
	public void changeQuant(String p_num, int su){
		ProductVO pvo = findCartProduct(p_num);
		// 카트에 해당 제품이 있는지 검사해서
		if(pvo!=null){		// 있으면 수량 변경
			total = total - pvo.getTotalprice();
			pvo.setQuant(su);
			total = total + pvo.getTotalprice();
		}
	}
	
	// 총액 반환
	public int getTotal(){
		return total;
	}
	
	// 카트 리스트 반환
	public List<ProductVO> getCartlist(){
		return plist;
	}
}