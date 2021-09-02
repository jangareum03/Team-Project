package com.jeontongju.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeontongju.Service.ProductService;
import com.jeontongju.VO.CartVO;
import com.jeontongju.VO.MemberVO;
import com.jeontongju.VO.ProductVO;
import com.jeontongju.VO.ReplyVO;
import com.jeontongju.VO.SearchCriteria;

@Controller
@RequestMapping("product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	ProductService productService;
	

		//카테고리별 상품리스트
		@RequestMapping(value="/cateList",method=RequestMethod.GET)
		public ModelAndView cateList(@RequestParam("category") String cateCode, ModelAndView model,ProductVO vo) throws Exception{
			logger.info("get cate list");
			
			model.setViewName("product/shopList");
			model.addObject("cateList",productService.cateList(cateCode));
			model.addObject("category", cateCode);
			
			
			return model;
		}
		
		  //상품 조회
		  @RequestMapping(value="/view",method=RequestMethod.GET) public ModelAndView
		  getView(@RequestParam("n") String pNo,ModelAndView model) throws Exception{
		  logger.info("get shop view");
		  
		  model.setViewName("product/shopView");
		  model.addObject("shopList",productService.shopList(pNo));
		  
			
		  return model;
		  
		  } 
		
		  
		// 상품 소감(댓글) 작성
		  @ResponseBody
		  @RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
		  public void registReply(ProductVO reply, HttpSession session) throws Exception {
		   logger.info("regist reply");
		   
		   MemberVO member = (MemberVO)session.getAttribute("member");
		   reply.setUserId(member.getUserId());
		   
		   productService.registReply(reply);
		  } 
		  
			  //상품소감 목록
			  @ResponseBody
			  @RequestMapping(value="/view/replyList",method = RequestMethod.GET) public
			  List<ProductVO> getReplyList(@RequestParam("n") String pNo)throws Exception{
			  logger.info("get reply list");
			  
			  List<ProductVO> reply=productService.replyList(pNo);
			  
			  return reply; 
			  }
			  
			// 상품 소감(댓글) 삭제
			  @ResponseBody
			  @RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
			  public int getReplyList(ProductVO reply, HttpSession session) throws Exception {
			   logger.info("post delete reply");

			   int result = 0;
			   
			   MemberVO member = (MemberVO)session.getAttribute("member");
			   String userId = productService.idCheck(reply.getcNO());
			     
			   if(member.getUserId().equals(userId)) {
			    
			    reply.setUserId(member.getUserId());
			    productService.deleteReply(reply);
			    
			    result = 1;
			   }
			   
			   return result; 
			  }
			// 상품 소감(댓글) 수정
			  @ResponseBody
			  @RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
			  public int modifyReply(ProductVO reply, HttpSession session) throws Exception {
			   logger.info("modify reply");
			   
			   int result = 0;
			   
			   MemberVO member = (MemberVO)session.getAttribute("member");
			   String userId = productService.idCheck(reply.getcNO());
			   
			   if(member.getUserId().equals(userId)) {
			    
			    reply.setUserId(member.getUserId());
			    productService.modifyReply(reply);
			    result = 1;
			   }
			   
			   return result;
			  } 
			  
			  //카트 담기
			  @ResponseBody
			  @RequestMapping(value="/view/addCart",method = RequestMethod.POST)
			  public int addCart(@ModelAttribute CartVO cart, HttpSession session) throws Exception{
				 String userId= (String) session.getAttribute("userId");
				 cart.setUserId(userId);
				 
				 int result = 0;
				 
				 MemberVO member = (MemberVO)session.getAttribute("member");
				 
				 if(member != null) {
				 
					 //장바구니에 기존 상품이 있는 지 검사
					 int count =productService.countCart(cart.getpNo(),userId);
					 
						 if(count == 0) {
							 productService.addCart(cart);
						 }else {
							 productService.updateCart(cart);
						 }
					  
					  cart.setUserId(member.getUserId());
					 
					  result=1;
				  }
				  return result;
			  }
			  
			  //상품 검색
			  @RequestMapping(value="/search", method=RequestMethod.GET)
			  public ModelAndView mainSearch(ModelAndView model,@ModelAttribute("sc") ProductVO vo)throws Exception{
				
				  logger.info("shop search");
				  
				  model.setViewName("product/shopSearch");
				  model.addObject("search",productService.mainSearch(vo));
				  model.addObject("titleMain",vo.getKeyword());
				  
				  return model;
				  
			  }
		
}
