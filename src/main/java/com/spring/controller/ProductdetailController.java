package com.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.CampusProductVO;
import com.spring.service.CampusProductService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProductdetailController {
	
	@Autowired
	private CampusProductService service;
	
	@RequestMapping(value ="/productdetail", method = RequestMethod.GET)
	public void productdetail(@PathVariable("p_number")int p_numer, Model model) throws Exception {
		log.info("상품 상세 보여주기");
		
		CampusProductVO vo = service.detailproduct(p_numer);
		model.addAttribute("detail",vo);
		
	}	

}