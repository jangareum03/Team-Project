package com.jeontongju.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jeontongju.VO.QnaVO;
import com.jeontongju.VO.ReplyVO;
import com.jeontongju.VO.SearchCriteria;

@Repository
public class QnaDAOImpl implements QnaDAO{
	
	@Inject
	private SqlSession sqlSession;
	//작성
	@Override
	public void write(QnaVO qnaVO) throws Exception {
		sqlSession.insert("qnaMapper.insert",qnaVO);
	}


	// 게시물 조회
	@Override
	public QnaVO read(int qNo) throws Exception {
		return sqlSession.selectOne("qnaMapper.read", qNo);
	}
	
	//수정
	@Override
	public void update(QnaVO qnaVO) throws Exception {
		sqlSession.update("qnaMapper.update", qnaVO);
	}
	//삭제
	@Override
	public void delete(int qNo) throws Exception {
		sqlSession.delete("qnaMapper.delete", qNo);
	}
	//목록
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("qnaMapper.listPage",scri);
	}
	//총개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectOne("qnaMapper.listCount",scri);
	}
	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int qNo) throws Exception {
		return sqlSession.selectList("qnaMapper.readReply", qNo);
	}

	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sqlSession.insert("qnaMapper.writeReply", vo);
		
	}

	//댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		sqlSession.update("qnaMapper.updateReply", vo);
		
	}

	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sqlSession.delete("qnaMapper.deleteReply", vo);
		
	}

	//댓글 선택 조회
	@Override
	public ReplyVO selectReply(int rNo) throws Exception {
	
		return sqlSession.selectOne("qnaMapper.selectReply", rNo);
	}

	//댓글 개수
	@Override
	public int count(int qNo) throws Exception {
	
		return sqlSession.selectOne("qnaMapper.countReply", qNo);
	}
	
}
