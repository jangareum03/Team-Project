package com.jeontongju.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeontongju.DAO.MemberDAO;
import com.jeontongju.VO.MemberVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.QnaVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	// 패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	// 나이 체크
	@Override
	public int ageChk(MemberVO vo) throws Exception {
		int result = dao.ageChk(vo);
		return 0;
	}

	// 회원 관리
	@Override
	public List<MemberVO> memberList(MemberVO memberVo) throws Exception {
		return dao.memberList(memberVo);
	}

	// 마이페이지_주문내역
	@Override
	public List<OrderVO> order(OrderVO vo) throws Exception {
		return dao.order(vo);
	}

	// 마이페이지_주문내역상세
	@Override
	public List<OrderVO> orderDetail(OrderVO vo) throws Exception {
		return dao.orderDetail(vo);
	}

	// 마이페이지_회원정보 조회
	@Override
	public MemberVO info(String userId) throws Exception {
		return dao.info(userId);
	}

	// 마이페이지_문의사항
	@Override
	public List<QnaVO> qna(String userId) throws Exception {
		return dao.qna(userId);
	}

	// 마이페이지_회원정보수정
	@Override
	public void update(MemberVO vo) throws Exception {
		dao.update(vo);
	}

	// 마이페이지_회원정보삭제
	@Override
	public void delete(MemberVO vo) throws Exception {
		dao.delete(vo);
	}
	

}
