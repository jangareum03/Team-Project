package com.jeontongju.DAO;

import java.util.List;

import com.jeontongju.VO.OrderDetailVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.ProductVO;

public interface OrderDAO {

	// 장바구니
	public List<OrderVO> cart(String userId) throws Exception;

	// 장바구니 총 결제금액
	public int total(String userId) throws Exception;

	// 장바구니 상품 개별삭제
	public void deleteItem(int cId) throws Exception;

	// 장바구니 상품 전체삭제
	public void deleteAll(String userId) throws Exception;

	// 주문서
	public List<OrderVO> order(int cId) throws Exception;

	// 주문 완료
	public void orderComplete(OrderVO vo) throws Exception;

	// 주문 내역 삽입
	public void orderInsert(OrderDetailVO vo) throws Exception;

	// 주문완료 상품 삭제
	public void orderDelete(OrderVO vo) throws Exception;

	// 상품수량 변경
	public void orderUpdate(ProductVO vo) throws Exception;
}
