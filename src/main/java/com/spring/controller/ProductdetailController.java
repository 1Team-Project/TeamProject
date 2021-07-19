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
//		log.info("��ǰ �� ������ �̵�");
//	}
	@PostMapping("/productdetail")
	public ModelAndView productdetail() {
		return null; // �̰� �������־ �������ܼ� null ����������� merge �Ҷ� �ٲ��ּ�..
	}
	
	@GetMapping("/cart")
	public void cartput() {
		log.info("����? �̰� �������� �����ִµ�??");
	}

}