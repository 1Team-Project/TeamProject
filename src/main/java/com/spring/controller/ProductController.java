package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
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
	public void getList(Model model,CampusCriteria cri) {
		log.info("전체 리스트 조회");
		//전체 리스트, CampusPageVO vo
		List<CampusProductVO> prolist=service.prolist(cri);
		
//		log.info("리스트" +prolist); //테스트용
		int total = service.total(cri);
		
		//베스트3
		List<CampusProductVO> bestlist=service.bestlist();
		log.info("best리스트" +bestlist);
		
		CampusPageVO campusPageVO = new CampusPageVO(cri,total);
		model.addAttribute("CampusPageVO", campusPageVO);
		model.addAttribute("prolist",prolist);
		model.addAttribute("bestlist",bestlist);
	}
	
	
	//상품 카테고리로 분류 나열?조회?
	@GetMapping("/catelist")
	public void cateList(String pc_code,Model model) {
		log.info("카테고리 조회");
		
		List<CampusProductVO> catelist=service.catelist(pc_code);
		log.info("cagtegory 리스트" +catelist);
		
		model.addAttribute("catelist",catelist);
	}//
	
	@GetMapping("/")
	public void getSearchList(String p_name, @ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("상품명 이용 - 상품 조회"+p_name);
		
		List<CampusProductVO> findlist=service.searchProduct(p_name);
		
		model.addAttribute(" findlist", findlist);
	}
	
	
	//게시판 글번호 읽어서 보는것처럼
	//상품 1개 조회, 보기 => 데이터 읽어온 후 productdetail.jsp
	@GetMapping("/viewproduct")
	public void viewproduct(int p_number, @ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("상품 상세 넘어가기"+p_number+"cri"+cri);
			
		CampusProductVO product=service.viewProduct(p_number);
			
		model.addAttribute("product", product);
	}
	
	
		
	
}
