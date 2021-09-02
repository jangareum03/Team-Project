package com.jeontongju.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeontongju.DAO.AdminDAO;
import com.jeontongju.VO.MemberVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.ProductVO;
import com.jeontongju.VO.QnaVO;
import com.jeontongju.VO.ReplyVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;

	// 상품조회
	@Override
	public ProductVO productView(String pNo) throws Exception {
		return dao.productView(pNo);
	}

	// 제품 내역 관리
	@Override
	public List<ProductVO> productList(ProductVO productVo) throws Exception {
		return dao.productList(productVo);
	}

	// 제품 등록
	@Override
	public void productAdd(ProductVO productVo) throws Exception {
		dao.productAdd(productVo);
	}

	// 상품 수정
	@Override
	public void productModify(ProductVO vo) throws Exception {
		dao.productModify(vo);
	}

	// 상품 삭제
	@Override
	public void productDelete(String pNo) throws Exception {
		dao.productDelete(pNo);
	}

	// 주문 내역 상세 조회
	@Override
	public List<OrderVO> orderView(String oId) throws Exception {
		return dao.orderView(oId);
	}

	// 주문 수정
	@Override
	public void orderModify(OrderVO vo) throws Exception {
		dao.orderModify(vo);
	}

	// 주문 삭제
	@Override
	public void orderDelete(String oId) throws Exception {
		dao.orderDelete(oId);
	}
	//주문 삭제 2
	@Override
	public void orderDetailsDelete(String oId) throws Exception {
		dao.orderDetailsDelete(oId);
	}

	// 회원 조회
	@Override
	public MemberVO memberView(String userId) throws Exception {
		return dao.memberView(userId);
	}

	// 회원 수정
	@Override
	public void memberModify(MemberVO vo) throws Exception {
		dao.memberModify(vo);

	}

	// 회원 삭제
	@Override
	public void memberDelete(String userId) throws Exception {
		dao.memberDelete(userId);

	}

	// 문의사항 관리
	@Override
	public List<QnaVO> qnaList(QnaVO qnaVo) throws Exception {
		return dao.qnaList(qnaVo);
	}

	// 문의 사항 조회
	@Override
	public QnaVO qnaView(int qNo) throws Exception {
		return dao.qnaView(qNo);
	}

	// 문의 사항 삭제
	@Override
	public void qnaDelete(int qNo) throws Exception {
		dao.qnaDelete(qNo);
	}

	// 댓글 조회
	@Override
	public List<ReplyVO> replyView(int qNo) throws Exception {
		return dao.replyView(qNo);
	}

	// 댓글 작성
	@Override
	public void replyWrite(ReplyVO vo) throws Exception {
		dao.replyWrite(vo);

	}

	// 댓글 수정
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		dao.replyUpdate(vo);

	}

	// 댓글 삭제
	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		dao.replyDelete(vo);

	}

	// 선택된 댓글 조회
	@Override
	public ReplyVO replySelect(int rNo) throws Exception {
		return dao.replySelect(rNo);
	}

	// 주문내역 조회
	@Override
	public List<OrderVO> orderList(OrderVO orderVo) throws Exception {
		return dao.orderList(orderVo);
	}

	// 배송 처리
	@Override
	public void delivery(OrderVO orderVo) throws Exception {
		dao.delivery(orderVo);
	}
}
