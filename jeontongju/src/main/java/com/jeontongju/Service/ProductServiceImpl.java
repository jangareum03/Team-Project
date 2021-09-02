package com.jeontongju.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeontongju.DAO.ProductDAO;
import com.jeontongju.VO.CartVO;
import com.jeontongju.VO.ProductVO;

@Service
public class ProductServiceImpl  implements ProductService{
	
	@Inject
	ProductDAO productDao;


	//카테고리
	@Override
	public List<ProductVO> cateList(String cateCode) throws Exception {
		return productDao.cateList(cateCode);
	}
	//상품조회
	@Override
	public ProductVO shopList(String pNo) throws Exception {
		
		return productDao.shopList(pNo);
	}
	//상품평 작성
	@Override
	public void registReply(ProductVO vo) throws Exception {
		productDao.registReply(vo);
		
	}
	//상품평 리스트
	@Override
	public List<ProductVO> replyList(String pNo) throws Exception {
		return productDao.replyList(pNo);
	}
	//상품평 삭제
	@Override
	public void deleteReply(ProductVO vo) throws Exception {
		productDao.deleteReply(vo);
	}
	//아아디체크
	@Override
	public String idCheck(int cNO) throws Exception {
		return productDao.idCheck(cNO);
	}
	//상품평 수정
	@Override
	public void modifyReply(ProductVO vo) throws Exception {
		productDao.modifiyReply(vo);
	}
	//카트담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		productDao.addCart(cart);
	}
	//장바구니 상품 수량 변경
	@Override
	public void updateCart(CartVO cart) throws Exception {
		productDao.updateCart(cart);		
	}
	//장바구니 상품 존재 확인
	@Override
	public int countCart(String pNo, String userId) throws Exception {		
		return productDao.countCart(pNo, userId);
	}
	//상품검색
	@Override
	public List<ProductVO> mainSearch(ProductVO vo) throws Exception {	
		return productDao.mainSearch(vo);
	}
	//BEST상품리스트
	@Override
	public List<ProductVO> bestList(ProductVO vo) throws Exception {		
		return productDao.bestList(vo);
	}
	//막걸리 상품리스트
	@Override
	public List<ProductVO> mList(ProductVO vo) throws Exception{
		return productDao.mList(vo);
	}
	//소주 상품리스트
	@Override
	public List<ProductVO> sList(ProductVO vo) throws Exception {
		return productDao.sList(vo);
	}
	//약주 상품리스트
	@Override
	public List<ProductVO> yList(ProductVO vo) throws Exception {
		return productDao.yList(vo);
	}
	//과실주 상품리스트
	@Override
	public List<ProductVO> fList(ProductVO vo) throws Exception {
		return productDao.fList(vo);
	}
	//안주 상품리스트
	@Override
	public List<ProductVO> nList(ProductVO vo) throws Exception {
		return productDao.nList(vo);
	}
	
}
