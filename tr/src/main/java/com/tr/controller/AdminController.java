package com.tr.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tr.Service.AdminService;
import com.tr.Service.MemberService;
import com.tr.VO.MemberVO;
import com.tr.VO.OrderListVO;
import com.tr.VO.OrderVO;
import com.tr.VO.ProductVO;
import com.tr.VO.QnaVO;
import com.tr.VO.ReplyVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	MemberService mService;
	@Autowired
	private AdminService aService;

	// 관리자 화면
	@RequestMapping(value = "/admin/adminPage", method = RequestMethod.GET)
	public void getAdmin() throws Exception {
		logger.info("get admin");
	}

	// 주문내역 관리
	@RequestMapping(value = "/order/orderList", method = RequestMethod.GET)
	public String order(OrderListVO orderVo, Model model) throws Exception {
		logger.info("get order");

		List<OrderVO> orderList = aService.orderList(orderVo);

		model.addAttribute("orderList", orderList);

		return "admin/order/orderList";
	}

	// 주문 배송 처리
	@RequestMapping(value = "/order/orderList", method = RequestMethod.POST)
	public String delivery(OrderVO orderVo) throws Exception {
		logger.info("post delivery");

		aService.delivery(orderVo);
		logger.info(orderVo.toString());

		return "redirect:/admin/order/orderList";
	}

	// 주문 내역 조회
	@RequestMapping(value = "/order/orderView", method = RequestMethod.GET)
	public void getOrderView(@RequestParam("n") String oId, Model model) throws Exception {
		logger.info("Get orderView");

		OrderVO order = aService.orderView(oId);
		logger.info("★" + order);
		model.addAttribute("order", order);
	}

	// 주문 수정 GET
	@RequestMapping(value = "/order/orderModify", method = RequestMethod.GET)
	public void getOrderModify(@RequestParam("n") String oId, Model model) throws Exception {
		logger.info("Get orderModify");

		OrderVO order = aService.orderView(oId);
		model.addAttribute("order", order);
	}

	// 주문 수정 POST
	@RequestMapping(value = "/order/orderModify", method = RequestMethod.POST)
	public String postOrderModify(OrderVO vo) throws Exception {
		logger.info("POST orderModify");
		logger.info(vo.toString());
		aService.orderModify(vo);
		

		return "redirect:/admin/order/orderList";
	}

	// 주문 삭제
	@RequestMapping(value = "/order/orderDelete", method = RequestMethod.POST)
	public String getOrderDelete(@RequestParam("n") int oId, Model model) throws Exception {
		logger.info("Get orderDelete");

		aService.orderDelete(oId);

		return "redirect:/admin/order/orderList";
	}

	// 상품 내역 관리
	@RequestMapping(value = "/product/productList", method = RequestMethod.GET)
	public String product(ProductVO productVo, Model model) throws Exception {
		logger.info("get productList");

		List<ProductVO> productList = aService.productList(productVo);
		model.addAttribute("productList", productList);
		logger.info(productVo.toString());

		return "admin/product/productList";
	}

	// 회원 관리
	@RequestMapping(value = "/member/memberList", method = RequestMethod.GET)
	public String product(MemberVO memberVo, Model model) throws Exception {
		logger.info("get memberList");

		List<MemberVO> memberList = mService.memberList(memberVo);
		model.addAttribute("memberList", memberList);

		return "admin/member/memberList";
	}

	// 회원 조회
	@RequestMapping(value = "/member/memberView", method = RequestMethod.GET)
	public void getMemberview(@RequestParam("n") String userId, Model model) throws Exception {
		logger.info("Get memberView");

		MemberVO member = aService.memberView(userId);
		model.addAttribute("member", member);
		logger.info(member.toString());
	}

	// 회원 수정 GET
	@RequestMapping(value = "/member/memberModify", method = RequestMethod.GET)
	public void getMemberModify(@RequestParam("n") String userId, Model model) throws Exception {
		logger.info("Get memberModify");

		MemberVO member = aService.memberView(userId);
		model.addAttribute("member", member);
		logger.info(member.toString());
	}

	// 회원 수정 POST
	@RequestMapping(value = "/member/memberModify", method = RequestMethod.POST)
	public String postMemberModify(MemberVO vo) throws Exception {
		logger.info("POST memberModify");
		logger.info(vo.toString());
		aService.memberModify(vo);

		return "redirect:/admin/member/memberList";
	}

	// 회원 삭제
	@RequestMapping(value = "/member/memberDelete", method = RequestMethod.POST)
	public String getMemberDelete(@RequestParam("n") String userId, Model model) throws Exception {
		logger.info("post memberDelete");

		aService.memberDelete(userId);
		logger.info(userId.toString());

		return "redirect:/admin/member/memberList";
	}

	// 문의 사항 내역
	@RequestMapping(value = "/qna/qnaList", method = RequestMethod.GET)
	public String qna(QnaVO qnaVo, Model model) throws Exception {
		logger.info("get qnaList");

		List<QnaVO> qnaList = aService.qnaList(qnaVo);
		model.addAttribute("qnaList", qnaList);

		return "admin/qna/qnaList";
	}

	// QnA 조회
	@RequestMapping(value = "/qna/qnaView", method = RequestMethod.GET)
	public void getqnaview(@RequestParam("n") int qNo, Model model) throws Exception {
		logger.info("Get qnaView");

		QnaVO qna = aService.qnaView(qNo);
		model.addAttribute("qna", qna);
		logger.info(qna.toString());
		//댓글 조회
		List<ReplyVO> replyList = aService.replyView(qNo);
		model.addAttribute("replyList",replyList);
		logger.info(replyList.toString());
	}

	// QnA 삭제
	@RequestMapping(value = "/qna/qnaDelete", method = RequestMethod.POST)
	public String getQnaDelete(@RequestParam("n") int qNo, Model model) throws Exception {
		logger.info("post qnaDelete");

		aService.qnaDelete(qNo);

		return "redirect:/admin/qna/qnaList";
	}
	//댓글 작성
	@RequestMapping(value="/qna/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("post reply Write");
		
		aService.replyWrite(vo);
		rttr.addAttribute("n", vo.getqNo());
		
		return "redirect:/admin/qna/qnaView";
	}
	//댓글 수정 GET
	@RequestMapping(value="/qna/replyUpdateView", method=RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, Model model) throws Exception{
		logger.info("get reply update");
		
		model.addAttribute("replyUpdate",aService.replySelect(vo.getrNo()));
		
		return "admin/qna/replyUpdateView";
	}
	//댓글 수정 POST
	@RequestMapping(value="/qna/replyUpdate",method=RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post reply Update");
		
		aService.replyUpdate(vo);
		
		rttr.addAttribute("n",vo.getqNo());
		
		return "redirect:/admin/qna/qnaView";
	}
	//댓글 삭제 GET
	@RequestMapping(value="/qna/replyDeleteView",method=RequestMethod.GET)
	public String replyDeleteView(ReplyVO vo, Model model) throws Exception{
		logger.info("get reply delete");
		
		model.addAttribute("replyDelete",aService.replySelect(vo.getrNo()));
		
		return "admin/qna/replyDeleteView";
	}
	//댓글 삭제 POST
	@RequestMapping(value="/qna/replyDelete", method=RequestMethod.POST)
	public String replyDelete(ReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post reply delete");
		
		aService.replyDelete(vo);
		
		rttr.addAttribute("n",vo.getqNo());
		logger.info(vo.toString());
		
		return "redirect: /admin/qna/qnaView";
	}
	
	
	// 제품 등록 get
	@RequestMapping(value = "/product/productAdd", method = RequestMethod.GET)
	public String getProductAdd(ProductVO productVo) throws Exception {
		logger.info("get productAdd");

		return "admin/product/productAdd";
	}

	// 제품 등록 post
	@RequestMapping(value = "/product/productAdd", method = RequestMethod.POST)
	public String postProductAdd(ProductVO productVo) throws Exception {
		logger.info("post productAdd");

		aService.productAdd(productVo);

		return "redirect:/admin/product/productList";
	}

	// 제품 조회
	@RequestMapping(value = "/product/productView", method = RequestMethod.GET)
	public void getProductview(@RequestParam("n") String pNo, Model model) throws Exception {
		logger.info("Get productView");

		ProductVO product = aService.productView(pNo);
		model.addAttribute("product", product);
	}

	// 제품 수정 GET
	@RequestMapping(value = "/product/productModify", method = RequestMethod.GET)
	public void getProductModify(@RequestParam("n") String pNo, Model model) throws Exception {
		logger.info("Get productModify");

		ProductVO product = aService.productView(pNo);
		model.addAttribute("product", product);
		logger.info(pNo.toString());
	}

	// 제품 수정 POST
	@RequestMapping(value = "/product/productModify", method = RequestMethod.POST)
	public String postProductModify(ProductVO vo) throws Exception {
		logger.info("POST productModify");
		logger.info(vo.toString());
		aService.productModify(vo);

		return "redirect:/admin/product/productList";
	}

	// 제품 삭제
	@RequestMapping(value = "/product/productDelete", method = RequestMethod.POST)
	public String getProductDelete(@RequestParam("n") String pNo, Model model) throws Exception {
		logger.info("Get productDelete");

		aService.productDelete(pNo);
		logger.info(pNo.toString());

		return "redirect:/admin/product/productList";
	}

}