package com.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.service.ProductDetailService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProductdetailController {
	
	@GetMapping("/productdetail")
	public void productdetail() {
		log.info("��ǰ �� ������ �׽�Ʈ");
	}


	@GetMapping("/cart")
	public void cartput() {
		log.info("��ٱ��� ������ �׽�Ʈ");
	}

}
