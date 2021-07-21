package com.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.domain.CampusUserVO;
import com.spring.domain.CartVO;
import com.spring.service.CartService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CartController {
//	
	@Autowired
	private CartService service;
	
//	//카트
//	@GetMapping("/cart")
//	public void getCartList() throws Exception{
//		log.info("장바구니 페이지");		
//	}
////	
	
	//장바구니 목록
	@RequestMapping("/listCart")
	public ModelAndView list(HttpSession session, ModelAndView view){
		
		log.info("장바구니 목록");
		
//		String viewName = (String)request
		
		Map<String, Object> map = new HashMap<>();		
		
		String u_userid = (String) session.getAttribute("u_userid");
		
		if(u_userid != null) { //로그인한 경우
			
			List<CartVO> list = service.listCart(u_userid);
			
			int sumMoney = service.sum(u_userid); //금액 합계
			
			map.put("sum", sumMoney); //전체 금액
			map.put("list",list); //장바구니 목록
			map.put("count", list.size()); //레코드 갯수
//			map.setViewName("/cart"); //이동할 페이지
//			map.addObject("map",map); //데이터 저장
			return view; //화면 이동
		
		}else { //로그인하지 않은 경우
			return new ModelAndView("/login");
			
		}
	}
	
	//장바구니 추가
	@ResponseBody
	@RequestMapping("/addCart")
	public String insert(@ModelAttribute CartVO cart, HttpSession session){
		
		log.info("장바구니 추가");
		String u_userid=(String)session.getAttribute("u_userid");
		
		if(u_userid == null) {
			return "redirect:/login";
		}
		cart.setU_userid(u_userid);
		service.addCart(cart);
		
		return "redirect:/cart"; //장바구니 목록으로 이동
		
		//장바구니가 기존 상품이 있는지 검사
		
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int c_cartnumber) {
		
		service.delete(c_cartnumber);
	
		return "redirect:/cart";
		
		
	}
	
	//장바구니 수정
	@RequestMapping("/update")
	public String update(int [] c_count, int[] c_cartnumber, HttpSession session) {
		
	String u_userid = (String)session.getAttribute("u_userid");
	for(int i=0; i<c_cartnumber.length; i++) {
		if(c_count[i]==0) {
			service.delete(c_cartnumber[i]);
		}else {
			CartVO cart = new CartVO();
			cart.setU_userid(u_userid);
			cart.setC_cartnumber(c_cartnumber[i]);
			cart.setC_count(c_count[i]);
			service.modifyCart(cart);
		}
	}
		return "redirect:/cart";
		
	}
}
	
	
	



