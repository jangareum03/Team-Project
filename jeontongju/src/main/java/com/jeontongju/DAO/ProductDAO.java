package com.jeontongju.DAO;

import java.util.List;
import java.util.Map;

import com.jeontongju.VO.CartVO;
import com.jeontongju.VO.ProductVO;
import com.jeontongju.VO.ReplyVO;

public interface ProductDAO {

	//상품 소감 작성
	public void registReply(ProductVO vo) throws Exception;
	
	//상품평 리스트
	public List<ProductVO> replyList(String pNo)throws Exception;
	
	//상품평 삭제
	public void deleteReply(ProductVO vo) throws Exception;
	
	//아이디체크
	public String idCheck(int cNO) throws Exception;
	
	//카테고리
	public List<ProductVO> cateList(String cateCode) throws Exception;
	
	//상품조회
	public ProductVO shopList(String pNo) throws Exception;
	
	//상품평 수정
	public void modifiyReply(ProductVO vo) throws Exception;
	
	//카트 담기
	public void addCart(CartVO cart)throws Exception;
	
	//장바구니 동일 상품 존재 확인
	public int countCart(String pNo,String userId)throws Exception;
	
	//장바구니 상품 수량 변경
	public void updateCart(CartVO cart)throws Exception;
	
	//상품검색
	public List<ProductVO> mainSearch(ProductVO vo) throws Exception;
	
	//BEST상품리스트
	public List<ProductVO> bestList(ProductVO vo) throws Exception;
	
	//막걸리상품리스트
	public List<ProductVO> mList(ProductVO vo) throws Exception;
	
	//소주상품리스트
	public List<ProductVO> sList(ProductVO vo) throws Exception;
	
	//약주상품리스트
	public List<ProductVO> yList(ProductVO vo) throws Exception;
	
	//과실주상품리스트
	public List<ProductVO> fList(ProductVO vo) throws Exception;
	
	//안주상품리스트
	public List<ProductVO> nList(ProductVO vo) throws Exception;
}
