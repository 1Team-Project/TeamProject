package com.spring.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
import com.spring.service.CampusBoardService;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
public class HomeController {
	
	@Autowired
	private CampusBoardService service;
	
	@GetMapping("/")
	public String home(Model model, CampusCriteria cri) {
		log.info("main 페이지");
		log.info("전체 리스트 요청");
		
		// 사용자가 선택한 페이지 게시물
		List<CampusBoardVO> list = service.list(cri);
		// 전체 게시물 수
		int total = service.total(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("pageVO", new CampusPageVO(cri, total));
		
		return "main";
	}
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		log.info("error 발생");
		return "AccessDenied";
	}

}