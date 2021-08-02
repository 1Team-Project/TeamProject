package com.spring.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/camp/*")
public class CampController {

	@GetMapping("/campinglist")
	public void campinglist() {
		log.info("캠핑장리스트");
		
		
	}
	
	@GetMapping("/campingdetail")
	public void calendar() {
		log.info("캠핑장리스트");
		
		
	}
	@GetMapping("/detail")
	public void cal() {
		log.info("달력테스트");
		
		
	}

}
	

