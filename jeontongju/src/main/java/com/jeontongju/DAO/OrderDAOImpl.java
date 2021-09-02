package com.jeontongju.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeontongju.VO.OrderDetailVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.ProductVO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Inject
	SqlSession sql;
	
	//장바구니
	@Override
	public List<OrderVO> cart(String userId) throws Exception {
		return sql.selectList("orderMapper.cart", userId);
	}
	
	//장바구니 총 결제금액
	@Override
	public int total(String userId) throws Exception {
		return sql.selectOne("orderMapper.total", userId);
	}
	
	//장바구니 상품 개별삭제
	@Override
	public void deleteItem(int cId) throws Exception {
		sql.delete("orderMapper.deleteItem", cId);
	}

	//장바구니 상품 전체삭제
	@Override
	public void deleteAll(String userId) throws Exception {
		sql.delete("orderMapper.deleteAll", userId);
	}
	
	//주문서
	@Override
	public List<OrderVO> order(int cId) throws Exception {
		return sql.selectList("orderMapper.order", cId);
	}
	
	//주문완료
	@Override
	public void orderComplete(OrderVO vo) throws Exception {
		sql.insert("orderMapper.orderComplete", vo);
	}

	//주문 내역 삽입
	@Override 
	 public void orderInsert(OrderDetailVO vo) throws Exception {
		 sql.insert("orderMapper.orderInsert", vo); 
	 }
	
	//주문완료상품 삭제
	@Override
	public void orderDelete(OrderVO vo) throws Exception {
		sql.delete("orderMapper.orderDelete", vo);
	}
	//상품수량 변경

	@Override
	public void orderUpdate(ProductVO vo) throws Exception {
		sql.update("orderMapper.orderUpdate",vo);
		
	}
	

	

}
