package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.domain.CampusProductVO;
import com.spring.service.CampusProductService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class ProductController {

	@Autowired
	private CampusProductService service;
	
	//상품 리스트 전체 나열?
	@GetMapping("/product")
	public void getList(Model model) {
		log.info("테스트");
		List<CampusProductVO> list=service.productList();
		
		
		model.addAttribute("list",list);
	}
	
	
	//상품 카테고리로 분류 나열?조회?
	
	
	//상품 찾기
	
	public void getSearchList(String p_name, Model model) {
		log.info("상품명 이용, 상품 조회");
		
		List<CampusProductVO> list=service.searchProduct(p_name);
		
		model.addAttribute("list",list);
	}
	
	
		
	
}