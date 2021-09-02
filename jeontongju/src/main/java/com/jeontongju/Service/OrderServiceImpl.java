package com.jeontongju.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeontongju.DAO.OrderDAO;
import com.jeontongju.VO.OrderDetailVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.ProductVO;

@Service
public class OrderServiceImpl implements OrderService{
	
	
	@Inject
	OrderDAO dao;
	
	// 장바구니
	@Override
	public List<OrderVO> cart(String userId) throws Exception {
		return dao.cart(userId);
	}

	//장바구니 총 결제금액
	@Override
	public int total(String userId) throws Exception {
		return dao.total(userId);
	}

	// 장바구니 상품 개별삭제
	@Override
	public void deleteItem(int cId) throws Exception {
		dao.deleteItem(cId);
	}

	//장바구니 상품 전체삭제
	@Override
	public void deleteAll(String userId) throws Exception {
		dao.deleteAll(userId);
	}
	
	//주문서
	@Override
	public List<OrderVO> order(int cId) throws Exception {
		return dao.order(cId);
	}

	//주문완료
	@Override
	public void orderComplete(OrderVO vo) throws Exception {
		dao.orderComplete(vo);
	}

	//주문내역 삽입
	@Override
	public void orderInsert(OrderDetailVO vo) throws Exception {
		dao.orderInsert(vo);
	}

	//주문완료상품 삭제
	@Override
	public void orderDelete(OrderVO vo) throws Exception {
		dao.orderDelete(vo);
	}

	//상품수량 변경
	@Override
	public void orderUpdate(ProductVO vo) throws Exception {
		dao.orderUpdate(vo);
	}
	
	

	
	

}
