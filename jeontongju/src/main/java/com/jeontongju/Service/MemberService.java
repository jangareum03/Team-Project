package com.jeontongju.Service;

import java.util.List;

import com.jeontongju.VO.MemberVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.QnaVO;

public interface MemberService {

	// 회원가입
	public void register(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;

	// 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;

	// 아이디 체크
	public int idChk(MemberVO vo) throws Exception;

	// 나이 체크
	public int ageChk(MemberVO vo) throws Exception;

	// 회원 관리
	public List<MemberVO> memberList(MemberVO vo) throws Exception;

	// 마이페이지_주문내역
	public List<OrderVO> order(OrderVO vo) throws Exception;

	// 마이페이지_주문내역상세
	public List<OrderVO> orderDetail(OrderVO vo) throws Exception;

	// 마이페이지_회원정보 조회
	public MemberVO info(String userId) throws Exception;

	// 마이페이지_문의사항
	public List<QnaVO> qna(String userId) throws Exception;

	// 마이페이지_회원정보수정
	public void update(MemberVO vo) throws Exception;

	// 마이페이지_회원정보삭제
	public void delete(MemberVO vo) throws Exception;
}
