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
	
	//��ǰ ����Ʈ ��ü ����?
	@GetMapping("/product")
	public void getList(Model model) {
		log.info("�׽�Ʈ");
		List<CampusProductVO> list=service.productList();
		
		
		model.addAttribute("list",list);
	}
	
	
	//��ǰ ī�װ��� �з� ����?��ȸ?
	
	
	//��ǰ ã��
	
	public void getSearchList(String p_name, Model model) {
		log.info("��ǰ�� �̿�, ��ǰ ��ȸ");
		
		List<CampusProductVO> list=service.searchProduct(p_name);
		
		model.addAttribute("list",list);
	}
	
	
		
	
}
