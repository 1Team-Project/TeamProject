package com.spring.controller;

import java.util.List;

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
//	@Autowired
//	private CartService service;
	
	//카트
	@GetMapping("/cart")
	public void getCartList() throws Exception{
		log.info("장바구니 페이지");		
	}
//	
//	//장바구니 목록
//	@RequestMapping(value="/cart",method=RequestMethod.GET)
//	public void cartlist(HttpSession session, Model model) throws Exception{
//		log.info("장바구니 목록");
//		
//		CampusUserVO user = (CampusUserVO)session.getAttribute("user");
//		String u_userid = user.getU_userid();
//		
//		List<CartVO> cart = service.listCart(u_userid);
//		
//		model.addAttribute("cart",cart);
//	}
//	
//	//장바구니 추가
//	@ResponseBody
//	@RequestMapping("/addCart")
//	public void insert(@ModelAttribute CartVO cart, HttpSession session) throws Exception{
//		
//		log.info("장바구니 추가");
//		
//		CampusUserVO user= (CampusUserVO)session.getAttribute("u_userid");
//		user.setU_userid(user.getU_userid());
//		
//		service.addCart(cart);
//		
//		//장바구니가 기존 상품이 있는지 검사
//		
//	}
//	
//	
//	//장바구니 수정
////	@RequestMapping("/update")
////	public String update(HttpSession session) {
////		
////		//session
////		String u_userid = (String)session.getAttribute("u_userid");
////		
////		return "redirect:/cart";
////		
////	}
//	
//	//장바구니 삭제
//	@RequestMapping("/delete")
//	public String delete(@RequestParam int c_cartnumber) {
//		
//		service.deleteCart(c_cartnumber);
//	
//		return "redirect:/cart";
//		
//		
//	}
//	

}
