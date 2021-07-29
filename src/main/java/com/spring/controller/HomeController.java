  
package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.domain.CampusAuthVO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusProductCategoryVO;
import com.spring.domain.CampusUserVO;
import com.spring.service.CampusBoardService;
import com.spring.service.CampusProductService;
import com.spring.service.CampusUserService;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {
	
	@Autowired
	private CampusBoardService service;
	@Autowired
	private CampusProductService product;

	
	@GetMapping("/")
	public String home(Model model, CampusCriteria cri) {
		log.info("main 페이지");
		log.info("전체 리스트 요청");
		
		List<CampusBoardVO> mainList = service.mainList(cri);
		
		model.addAttribute("mainList", mainList);
		
		//카테고리값넘기기
		List<CampusProductCategoryVO> category = product.category(cri);
		model.addAttribute("category",category);
		
		return "main";
		
	}
		
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		log.info("error 발생");
		return "AccessDenied";
	}
<<<<<<< HEAD
=======
	
	@GetMapping("/AccessDenide")
	public String AccessDenide() {
		log.info("error 발생");
		return "AccessDenied";
	}
	
	
>>>>>>> refs/remotes/origin/youngkwon

}