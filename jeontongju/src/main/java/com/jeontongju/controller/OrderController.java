package com.jeontongju.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeontongju.Service.MemberService;
import com.jeontongju.Service.OrderService;
import com.jeontongju.VO.MemberVO;
import com.jeontongju.VO.OrderDetailVO;
import com.jeontongju.VO.OrderVO;
import com.jeontongju.VO.ProductVO;

@Controller
@RequestMapping("/order/*")
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Inject
	OrderService service;

	@Inject
	MemberService mservice;

	// 장바구니
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart(Model model, HttpSession session) throws Exception {
		logger.info("★장바구니 진입....cart get");
		String userId = (String) session.getAttribute("userId");

		if (userId != null) {
			Map<String, Object> map = new HashMap<String, Object>();

			List<OrderVO> cartItems = service.cart(userId);
			int total = service.total(userId);

			map.put("items", cartItems);
			map.put("itemsYN", cartItems.size());
			map.put("total", total);

			logger.info("얍" + map);
			model.addAttribute("cart", map);

			return "order/cart";
		} else {
			return "redirect:/member/loginPage";
		}
	}

	// 장바구니 상품 개별삭제
	@RequestMapping(value = "deleteItem", method = RequestMethod.GET)
	public String delete(@RequestParam int cId) throws Exception {
		logger.info("★장바구니 상품개별삭제....deleteItem get");

		service.deleteItem(cId);

		return "redirect:/order/cart";
	}

	// 장바구니 상품 전체삭제
	@RequestMapping(value = "deleteAll", method = RequestMethod.GET)
	public String deleteAll(HttpSession session) throws Exception {
		logger.info("★장바구니 상품전체삭제....deleteAll get");

		String userId = (String) session.getAttribute("userId");

		service.deleteAll(userId);

		return "redirect:/order/cart";
	}

	// 주문서
	@RequestMapping(value = "order", method = RequestMethod.GET)
	public String orderView(HttpSession session, Model model, @RequestParam(value = "cId") int[] values)
			throws Exception {
		logger.info("★주문서 진입....order get");

		String userId = (String) session.getAttribute("userId");

		// 장바구니에서 선택한 상품 출력
		Map<String, Object> map = new HashMap<String, Object>();
		int total = 0;

		for (int i = 0; i < values.length; i++) {
			session.setAttribute("cId" + i, values[i]);
			map.put("item" + i, service.order(values[i]).get(0));

			total += service.order(values[i]).get(0).getCount() * service.order(values[i]).get(0).getpPrice();
			session.setAttribute("count" + i, service.order(values[i]).get(0).getCount());
			session.setAttribute("no" + i, service.order(values[i]).get(0).getpNo());
		}
		model.addAttribute("order", map);
		model.addAttribute("num", values.length);
		session.setAttribute("size", values.length);

		// 주문자 정보
		MemberVO member = mservice.info(userId);

		model.addAttribute("userName", member.getUserName());
		model.addAttribute("userPhone", member.getUserPass());
		model.addAttribute("userEmail", member.getUserEmail());

		// 상품금액
		model.addAttribute("total", total);

		return "order/order";
	}

	// 주문완료
	@RequestMapping(value = "orderComplete", method = RequestMethod.POST)
	public String orderInsert(HttpSession session, OrderVO vo, ProductVO pvo, OrderDetailVO dvo,
			@RequestParam(value = "cId") int[] values) throws Exception {
		logger.info("★주문완료....orderComplete post");

		// 사용자 아이디
		String userId = (String) session.getAttribute("userId");
		vo.setUserId(userId);

		// 주문번호(oId) 생성
		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String ymds = ymd + new DecimalFormat("00").format(cal.get(Calendar.SECOND));
		String subNum = "";

		for (int i = 1; i <= 4; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String oId = ymds + subNum;
		vo.setoId(oId);

		// 구매날짜
		Date now = new Date();
		vo.setoDate(now);

		service.orderComplete(vo);

		// 장바구니 번호(cId) 구별
		dvo.setoId(oId);

		for (int i = 0; i < (Integer) session.getAttribute("size"); i++) {
			vo.setcId(values[i]);
			dvo.setcId(values[i]);
			service.orderInsert(dvo);
			service.orderDelete(vo);
		}

		// 구매한 상품 재고 및 판매수량 변경
		int pSales, pCount = 0;
		String no = null;
		for (int i = 0; i < (int) session.getAttribute("size"); i++) {
			pSales = (int) session.getAttribute("count" + i);
			pCount = (int) session.getAttribute("count" + i);
			no = (String) session.getAttribute("no" + i);

			pvo.setpNo(no);
			pvo.setpSales(pSales);
			pvo.setpCount(pCount);

			service.orderUpdate(pvo);

			session.removeAttribute("count" + i);
			session.removeAttribute("no" + i);
		}

		return "redirect:/";
	}

}
