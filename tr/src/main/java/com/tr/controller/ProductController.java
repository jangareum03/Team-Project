package com.tr.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tr.Service.ProductService;

@Controller
@RequestMapping("product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	ProductService productService;
	
	//1.상품 전체 목록
	@RequestMapping("/list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("product/productList");
		mav.addObject("list",productService.listProduct());
		return mav;
	}
		
	  //2. 상품 상세보기
	  
	  @RequestMapping("detail/{pNO}")  
	  public ModelAndView detail(@PathVariable("pNO") String pNO, ModelAndView mav) {
	  mav.setViewName("product/productDetail");
	  mav.addObject("vo",productService.detailProduct(pNO)); 
	  return mav; }
	 
	  //카테고리별 상품리스트
	  

}
