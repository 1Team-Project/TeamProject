package com.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.ProductDetailService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProductdetailController {
	
//	@GetMapping("/productdetail")
//	public void productdetail() {
//		log.info("상품 상세 페이지 이동");
//	}
	@PostMapping("/productdetail")
	public ModelAndView productdetail() {
		return null; // 이거 안적혀있어서 오류생겨서 null 적어놓은거임 merge 할때 바꿔주셈..
	}
	
	@GetMapping("/cart")
	public void cartput() {
		log.info("머지? 이거 깃허브부터 깨져있는데??");
	}

}