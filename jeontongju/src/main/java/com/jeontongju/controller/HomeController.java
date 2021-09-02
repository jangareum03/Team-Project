package com.jeontongju.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jeontongju.Service.ProductService;
import com.jeontongju.VO.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@GetMapping(value = "/")
	public String home(Locale locale, Model model, ProductVO vo) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//BEST상품리스트
		model.addAttribute("bestList",productService.bestList(vo));
		//막걸리상품리스트
		model.addAttribute("mList", productService.mList(vo));
		//소주상품리스트
		model.addAttribute("sList", productService.sList(vo));
		//약주상품리스트
		model.addAttribute("yList", productService.yList(vo));
		//과실주상품리스트
		model.addAttribute("fList", productService.fList(vo));
		//안주상품리스트
		model.addAttribute("nList", productService.nList(vo));
		
		return "home";
	}
	
}
