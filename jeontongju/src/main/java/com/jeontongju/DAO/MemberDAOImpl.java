package com.jeontongju.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeontongju.VO.MemberVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.QnaVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sql;
	
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception{
		sql.insert("memberMapper.register",vo);
	}
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.login",vo);
	}
	//패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception{
		int result = sql.selectOne("memberMapper.passChk", vo);
		return result;
	}
	//아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception{
		int result=sql.selectOne("memberMapper.idChk", vo);
		return result;
	}
	//나이 체크
	@Override
	public int ageChk(MemberVO vo) throws Exception {
		int result=sql.selectOne("memberMapper.ageChk", vo);
		return result;
	}
	//회원 관리
	@Override
	public List<MemberVO> memberList(MemberVO memberVo) throws Exception {
		return sql.selectList("memberList",memberVo);
	}
	// 마이페이지_주문내역
		@Override
		public List<OrderVO> order(OrderVO vo) throws Exception {
			return sql.selectList("memberMapper.order", vo);
		}

		//마이페이지_주문내역상세
		@Override
		public List<OrderVO> orderDetail(OrderVO vo) throws Exception{
			return sql.selectList("memberMapper.orderDetail", vo);
		}
		
		//마이페이지_회원정보 조회
		@Override
		public MemberVO info(String userId) throws Exception {
			return sql.selectOne("memberMapper.info", userId);
		}


		// 마이페이지_문의사항
		@Override
		public List<QnaVO> qna(String userId) throws Exception {
			return sql.selectList("memberMapper.qna", userId);
		}

		// 마이페이지_회원정보수정
		@Override
		public void update(MemberVO vo) throws Exception {
			sql.update("memberMapper.update", vo);
		}

		//마이페이지_회원정보삭제
		@Override
		public void delete(MemberVO vo) throws Exception {
			sql.delete("memberMapper.delete", vo);
			
		}
	

}
