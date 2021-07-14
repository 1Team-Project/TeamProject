package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CampusUserVO;
import com.spring.service.CampusUserService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class RegisterController {
	
	@Autowired
	private CampusUserService service;
	
	// 회원가입 버튼 누를 시 이동
	@PostMapping("/agree")
	public void agreeGet() {
		log.info("약관 동의 페이지 요청");
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		log.info("약관 동의 페이지 요청");
		return "mypage";
	}
	
	// 약관 동의 시 이동
	@PostMapping("/regist")
	public void registerPost() {
		log.info("회원가입 페이지 요청");
	}
	
	
	// 회원가입 정보를 가져오는 컨트롤러 생성
	@PostMapping("/regist2")
	public String regist2Post(@ModelAttribute("member") CampusUserVO vo) {
		log.info("회원가입 요청 " + vo);
		
		try {
			if(service.insert(vo)) {
				return "redirect:/login";
			} else {
				return "regist2";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "AccessDenied";
		}
		
		
//		// 서비스 작업
//		if(service.insert(vo)) {
//			return "redirect:/login";
//		} else {
//			return "regist2";
//		}
	}

	// 중복 아이디 검사
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/checkId")
	public String checkId(String u_userid) {
		log.info("중복아이디 검사 " + u_userid);
		CampusUserVO vo = service.dupId(u_userid);
		if(vo!=null) {
			return "false";
		}
		return "true";
	}
	
	// /register 직접 눌러서 접근하는 경우 - 405에러
	@GetMapping(value={"/regist"})
	public String handleStep() {
		return "redirect:agree";
	}
}
