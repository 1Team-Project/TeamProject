package com.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
import com.spring.service.CampusBoardService;

//import com.spring.domain.CampusBoardPage;
//import com.spring.domain.CampusBoardVO;
//import com.spring.service.CampusBoardService;
//import com.spring.domain.CampusBoardPageVO;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j2
@RequestMapping("/board/*")
public class BoradController {
	
	@Autowired
	private CampusBoardService service;
	
	@GetMapping("/list")
	public void list(Model model, CampusCriteria cri) {
		
		log.info("전체 리스트 조회");
		List<CampusBoardVO> list = service.list(cri);
		int total = service.total(cri);
		
		
		model.addAttribute("list", list);
		CampusPageVO pageVo = new CampusPageVO(cri, total);
		model.addAttribute("pageVO", pageVo);
	}
	
	@GetMapping("/write")
	public void write() {
		log.info("글 작성 이동 실행");
	}
	
	@GetMapping("/modify")
	public void modify() {
		log.info("글 수정 이동 실행");
	}
	
	@GetMapping("/view")
	public void view() {
		log.info("글 보기 이동 실행");
	}
	
	@GetMapping("/sellwrite")
	public void sellwrite() {
		log.info("판매 등록 이동 실행");
	}
	
	@GetMapping("/sellmodify")
	public void sellmodify() {
		log.info("판매 수정 이동 실행");
	}
	
}
