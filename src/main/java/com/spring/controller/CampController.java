package com.spring.controller;

import java.sql.ResultSet;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusCampingjangVO;
import com.spring.service.CampusBoardService;
//import com.spring.service.CampusCampingjangService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2

public class CampController {

	@GetMapping("/campingjang")
	public String total() {
		log.info("캠핑장");
		//service.insert(number, area,sysdata,rsysdata);
		return "camp";
	}

//	@Autowired
//	private CampusCampingjangService service;
//	
//	@GetMapping("/campingjang")
//	public String registerCampingjang(int number, int area,Date sysdata,Date rsysdata,string contant ) {
//		log.info("캠핑장");
//		//service.insert(number, area,sysdata,rsysdata);
//		return "camp";
//	}
	
	//public boolean insert(int number, int area) {
		//sql구문
		
		//ResultSet
	}
	

