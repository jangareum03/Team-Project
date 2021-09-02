package com.jeontongju.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeontongju.Service.QnaService;
import com.jeontongju.VO.PageMaker;
import com.jeontongju.VO.QnaVO;
import com.jeontongju.VO.ReplyVO;
import com.jeontongju.VO.SearchCriteria;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Inject
	QnaService service;
	
	
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	
	// 게시판 글 작성
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public String write(QnaVO qnaVO, HttpSession session) throws Exception{
			logger.info("write");
			
			service.write(qnaVO);
			
			//비밀번호 저장
			int pass = qnaVO.getqPass();
			session.setAttribute("qPass", pass);
			
			return "redirect:/qna/list";
		}
	
	// 게시판 목록 
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
			logger.info("list");
			
			model.addAttribute("list", service.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setScri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "qna/list";
		
		
		}
		
		// 게시판 조회
		@RequestMapping(value = "/readView", method = {RequestMethod.GET,RequestMethod.POST})
		public String read(QnaVO qnaVO,@ModelAttribute("scri") SearchCriteria scri ,Model model, @RequestParam("qno") int qNo) throws Exception{
			logger.info("read.....");
			
			qnaVO.setqNo(qNo);
			logger.info("qno값=" + qNo);
			
			model.addAttribute("read", service.read(qnaVO.getqNo()));
			model.addAttribute("scri",scri);
			
			List<ReplyVO> replyList=service.readReply(qnaVO.getqNo());
			model.addAttribute("replyList",replyList);
			//댓글개수 
			model.addAttribute("count", service.count(qNo));
			
			return "qna/readView";
		}
		
		// 게시판 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(QnaVO qnaVO,@ModelAttribute("scri") SearchCriteria scri , Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.read(qnaVO.getqNo()));
			model.addAttribute("scri",scri);
			
			return "qna/updateView";
		}
		
		// 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(QnaVO qnaVO,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr ) throws Exception{
			logger.info("update");
			
			service.update(qnaVO);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/list";
		}

		// 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(QnaVO qnaVO,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr ) throws Exception{
			logger.info("delete");
			
			service.delete(qnaVO.getqNo());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/list";
		}
		
		//댓글 작성
		@RequestMapping(value="/replyWrite", method=RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			logger.info("reply Write");
			
			service.writeReply(vo);
			
			rttr.addAttribute("qno",vo.getqNo());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/readView";
			
		}
		
		//댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model, @RequestParam("qno") int qNo, @RequestParam("rno") int rNo) throws Exception {
			logger.info("reply update view");
			
			vo.setqNo(qNo);
			vo.setrNo(rNo);
						
			model.addAttribute("replyUpdate", service.selectReply(vo.getrNo()));
			model.addAttribute("scri", scri);
			logger.info(".."+vo.getqNo());
			
			return "qna/replyUpdateView";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply update");
			
			service.updateReply(vo);
			
			
			rttr.addAttribute("qno", vo.getqNo());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/readView";
		}
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model, @RequestParam("qno") int qNo, @RequestParam("rno") int rNo) throws Exception {
			logger.info("reply delete view");
			
			vo.setqNo(qNo);
			vo.setrNo(rNo);
			
			model.addAttribute("replyDelete", service.selectReply(vo.getrNo()));
			model.addAttribute("scri", scri);
			

			return "qna/replyDeleteView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply delete");
			
			service.deleteReply(vo);
			
			rttr.addAttribute("qno", vo.getqNo());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/readView";
		}
}
