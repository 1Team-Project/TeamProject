package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProductdetailController {
	
	@GetMapping("/productdetail")
	public void buyproduct() {
		log.info("상품 상세 페이지 테스트");
	}
	@GetMapping("/cart")
	public void cartput() {
		log.info("장바구니 페이지 테스트");
	}

}
