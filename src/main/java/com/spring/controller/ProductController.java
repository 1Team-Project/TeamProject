package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.domain.CampusProductVO;
import com.spring.service.CampusProductService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
//@RequestMapping()
public class ProductController {

	@Autowired
	private CampusProductService service;
	
	//��ǰ ����Ʈ ��ü ����?
	@GetMapping("/product")
	public void getList(Model model) {
		log.info("상품 상세");
		List<CampusProductVO> list=service.productList();
		
		model.addAttribute("list",list);
	}	
	public void getSearchList(String p_name, Model model) {
		log.info("��ǰ�� �̿�, ��ǰ ��ȸ");
		
		List<CampusProductVO> list=service.searchProduct(p_name);
		
		model.addAttribute("list",list);
	}
	
	
//	@RequestMapping("/productdetail/{p_number}")
//	public void productdetail(@PathVariable(value="p_number") int p_number, Model model) throws Exception {
//		log.info("상품 하나 선택해서 보여주기");
//		
//		CampusProductVO vo = service.detailproduct(p_number);
//		model.addAttribute("vo",vo);
//	}
	
	
	@GetMapping("/productdetail")
	public void productdetail() {
		log.info("상품 상세");
	}
}
