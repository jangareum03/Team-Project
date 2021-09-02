package com.jeontongju.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeontongju.VO.MemberVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.ProductVO;
import com.jeontongju.VO.QnaVO;
import com.jeontongju.VO.ReplyVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sql;

	// 상품조회
	@Override
	public ProductVO productView(String pNo) throws Exception {
		return sql.selectOne("adminMapper.productView", pNo);
	}

	// 상품 내역 조회
	@Override
	public List<ProductVO> productList(ProductVO productVo) throws Exception {
		return sql.selectList("adminMapper.productList", productVo);
	}

	// 상품 등록
	@Override
	public void productAdd(ProductVO productVo) throws Exception {
		sql.insert("adminMapper.productAdd", productVo);
	}

	// 상품 수정
	public void productModify(ProductVO vo) throws Exception {
		sql.update("adminMapper.productModify", vo);
	}

	// 상품 삭제
	@Override
	public void productDelete(String pNo) throws Exception {
		sql.delete("adminMapper.productDelete", pNo);
	}

	// 주문 내역 조회
	@Override
	public List<OrderVO> orderView(String oId) throws Exception {
		return sql.selectList("adminMapper.orderView", oId);
	}

	// 주문 수정
	@Override
	public void orderModify(OrderVO vo) throws Exception {
		sql.update("adminMapper.orderModify", vo);
	}

	// 주문 삭제
	@Override
	public void orderDelete(String oId) throws Exception {
		sql.delete("adminMapper.orderDelete", oId);
	}
	//주문 삭제 2
	@Override
	public void orderDetailsDelete(String oId) throws Exception {
		sql.delete("adminMapper.orderDetailsDelete", oId);
	}

	// 회원 조회
	@Override
	public MemberVO memberView(String userId) throws Exception {
		return sql.selectOne("adminMapper.memberView", userId);
	}

	// 회원 수정
	@Override
	public void memberModify(MemberVO vo) throws Exception {
		sql.update("adminMapper.memberModify", vo);

	}

	// 회원 삭제
	@Override
	public void memberDelete(String userId) throws Exception {
		sql.delete("adminMapper.memberDelete", userId);

	}

	// 문의 사항 조회
	@Override
	public QnaVO qnaView(int qNo) throws Exception {
		return sql.selectOne("adminMapper.qnaView", qNo);
	}

	// QnA 삭제
	@Override
	public void qnaDelete(int qNo) throws Exception {
		sql.delete("adminMapper.qnaDelete", qNo);
	}

	// 댓글 조회
	@Override
	public List<ReplyVO> replyView(int qNo) throws Exception {
		return sql.selectList("adminMapper.replyView", qNo);
	}

	// 댓글 작성
	@Override
	public void replyWrite(ReplyVO vo) throws Exception {
		sql.insert("adminMapper.replyWrite", vo);

	}

	// 댓글 수정
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		sql.update("adminMapper.replyUpdate", vo);

	}

	// 댓글 삭제
	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		sql.update("adminMapper.replyDelete", vo);

	}

	// 선택된 댓글 조회
	@Override
	public ReplyVO replySelect(int rNo) throws Exception {
		return sql.selectOne("adminMapper.replySelect", rNo);
	}

	// 주문 내역 조회
	@Override
	public List<OrderVO> orderList(OrderVO orderVo) throws Exception {
		return sql.selectList("adminMapper.orderList", orderVo);
	}

	// 배송 처리
	@Override
	public void delivery(OrderVO orderVo) throws Exception {
		sql.update("adminMapper.delivery", orderVo);
	}

	// 문의 사항 관리
	@Override
	public List<QnaVO> qnaList(QnaVO qnaVo) throws Exception {
		return sql.selectList("adminMapper.qnaList", qnaVo);
	}
}
