package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CampusProductVO;
import com.spring.domain.CampusUserVO;
import com.spring.domain.CartListVO;
import com.spring.domain.CartVO;
import com.spring.service.CartService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CartController {
	
	@Autowired
	private CartService service;

	
	//장바구니 목록
	@PreAuthorize("hasAnyAuthority('ROLE_USER')")
	@RequestMapping("/cart")
	public void list(Model model, String u_userid){
		
		log.info("장바구니 목록보여주기");
	
		List<CartListVO> cartlist = service.listCart(u_userid);
		
		model.addAttribute("cartlist",cartlist);			
	}


	
//	//장바구니 담기
	@PreAuthorize("hasAnyAuthority('ROLE_USER')")
	@ResponseBody
	@PostMapping("/cart")
	   public boolean addCart(CartVO cart, HttpSession session){
	      
	      log.info("장바구니 추가" +cart);

	     return service.addCart(cart);
	}

    //장바구니 삭제	
	@RequestMapping("/cart")
	public String delete(int c_cartnumber) {
		
		log.info("장바구니 삭제");
		
		service.delete(c_cartnumber);

		return "redirect:/cart";

	}
}
////	
////	//장바구니 수정
////	@RequestMapping("/update")
////	public String update(int [] c_count, int[] c_cartnumber, HttpSession session) {
////		
////	String u_userid = (String)session.getAttribute("u_userid");
////	for(int i=0; i<c_cartnumber.length; i++) {
////		if(c_count[i]==0) {
////			service.delete(c_cartnumber[i]);
////		}else {
////			CartVO cart = new CartVO();
////			cart.setU_userid(u_userid);
////			cart.setC_cartnumber(c_cartnumber[i]);
////			cart.setC_count(c_count[i]);
////			service.modifyCart(cart);
////		}
////	}
////		return "redirect:/cart";
////		
////	}
	
	
	



