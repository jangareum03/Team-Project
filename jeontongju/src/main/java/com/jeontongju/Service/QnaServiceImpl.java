package com.jeontongju.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jeontongju.DAO.QnaDAO;
import com.jeontongju.VO.QnaVO;
import com.jeontongju.VO.ReplyVO;
import com.jeontongju.VO.SearchCriteria;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Inject
	private QnaDAO dao;
	//게시글 작성
	@Override
	public void write(QnaVO qnaVO) throws Exception {
		dao.write(qnaVO);
	}


	//조회
	@Override
	public QnaVO read(int qNo) throws Exception {
		return dao.read(qNo);
	}
	//수정
	@Override
	public void update(QnaVO qnaVO) throws Exception {
		dao.update(qnaVO);
	}
	//삭제
	@Override
	public void delete(int qNo) throws Exception {
		dao.delete(qNo);
	}
	// 게시물 목록
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	//총개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int qNo) throws Exception {
		return dao.readReply(qNo);
	}

	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
		
	}

	//댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}

	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}

	//댓글 선택 조회
	@Override
	public ReplyVO selectReply(int rNo) throws Exception {
		return dao.selectReply(rNo);
	}

	//댓글 개수
	@Override
	public int count(int qNo) throws Exception {
	
		return dao.count(qNo);
	}

}
