package com.tr.Service;

import java.util.List;

import com.tr.VO.CartVO;

public interface ShopService {

	//장바구니 조회
	public List<CartVO> list(String userId) throws Exception;
	
	//장바구니 상품 합계
	public int total(String userId) throws Exception;
	
	//장바구니_상품삭제
	public void delete(CartVO vo) throws Exception;
}