package com.spring.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.service.CampusBoardService;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
<<<<<<< HEAD
public class HomeController {
	
	@Autowired
	private CampusBoardService service;
	
=======
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)


>>>>>>> refs/remotes/origin/seunghyun
	@GetMapping("/")
<<<<<<< HEAD
	public String home(Model model, CampusCriteria cri) {
		log.info("main 페이지");
		log.info("전체 리스트 요청");
		
		List<CampusBoardVO> mainList = service.mainList(cri);
=======

	public String home(Locale locale, Model model) {
>>>>>>> refs/remotes/origin/seunghyun

<<<<<<< HEAD
		model.addAttribute("mainList", mainList);
		return "main";
=======
		log.info("�׽�Ʈ");
	
		return "/index";
>>>>>>> refs/remotes/origin/seunghyun
	}
	
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		log.info("error 발생");
		return "AccessDenied";
	}

}