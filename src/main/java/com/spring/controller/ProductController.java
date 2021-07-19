package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusProductVO;
import com.spring.service.CampusProductService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	private CampusProductService service;
	
	//상품 리스트 전체 나열 + best3까지
	@GetMapping("/productlist")
	public void getList(Model model) {
		log.info("테스트");
		//전체 리스트
//		List<CampusProductVO> prolist=service.prolist();
//		log.info("리스트" +prolist);
		//베스트3
		List<CampusProductVO> bestlist=service.bestlist();
		log.info("best리스트" +bestlist);
		
//		model.addAttribute("prolist",prolist);
		model.addAttribute("bestlist",bestlist);
	}
	
	
	//상품 카테고리로 분류 나열?조회?
	
	
		//상품 찾기
		
		public void getSearchList(String p_name, @ModelAttribute("cri") CampusCriteria cri,Model model) {
			log.info("상품명 이용 - 상품 조회"+p_name);
			
			List<CampusProductVO> findlist=service.searchProduct(p_name);
			
			model.addAttribute(" findlist", findlist);
		}
	
	
		
	
}
