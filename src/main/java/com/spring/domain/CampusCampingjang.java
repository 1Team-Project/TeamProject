package com.spring.domain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.controller.HomeController;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CampusCampingjang {

	@GetMapping("/camping")
	public void productdetail() {
		log.info("캠핑장");
	}
	
	
	
	
}
