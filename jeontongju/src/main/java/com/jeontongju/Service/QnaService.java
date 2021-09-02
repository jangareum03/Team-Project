package com.jeontongju.Service;

import java.util.List;

import com.jeontongju.VO.QnaVO;
import com.jeontongju.VO.ReplyVO;
import com.jeontongju.VO.SearchCriteria;

public interface QnaService {
	// 게시글 작성
		public void write(QnaVO qnaVO) throws Exception;
	
	// 게시물 목록 조회
	public List<QnaVO> list(SearchCriteria scri) throws Exception;
	
	//총개수
	public int listCount(SearchCriteria scri) throws Exception;
	// 게시물 조회
	public QnaVO read(int qNo) throws Exception;
	
	// 게시물 수정
	public void update(QnaVO qnaVO) throws Exception;
		
	// 게시물 삭제
	public void delete(int qNo) throws Exception;
	
	//댓글 조회
	public List<ReplyVO> readReply(int qNo) throws Exception;
	
	//댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;
	
	//댓글 수정
	public void updateReply(ReplyVO vo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReplyVO vo) throws Exception;
	
	//댓글 선택 조회
	public ReplyVO selectReply(int rNo) throws Exception;

	//댓글 개수
	public int count(int qNo)throws Exception;

}
