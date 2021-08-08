package com.spring.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusProductCategoryVO;
import com.spring.service.CampusProductService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/camp/*")
public class CampController {
	
	@Autowired
	private CampusProductService product;
	
	
	@GetMapping("/campinglist")
	public void campinglist(Model model, CampusCriteria cri) {
		log.info("캠핑장리스트");
		
		//카테고리값넘기기
		List<CampusProductCategoryVO> category = product.category(cri);
		model.addAttribute("category",category);
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/campingdetail")
	public void calendar() {
		log.info("캠핑장리스트");
		
		
	}
	@GetMapping("/detail")
	public void cal() {
		log.info("달력테스트");
		
		
	}

}
	

