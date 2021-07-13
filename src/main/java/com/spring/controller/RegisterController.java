package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class RegisterController {
	
	@Autowired
	private MemberService service;
	
	// 회원가입 버튼 누를 시 이동
	@PostMapping("/agree")
	public void agreeGet() {
		log.info("약관 동의 페이지 요청");
	}
	
	// 약관 동의 시 이동
	@PostMapping("/regist")
	public void registerPost() {
		log.info("회원가입 페이지 요청");
	}
	
	
	// 회원가입 정보를 가져오는 컨트롤러 생성
	@PostMapping("/regist2")
	public String regist2Post(@ModelAttribute("member") MemberVO vo) {
		log.info("회원가입 요청 " + vo);
//		log.info("###--### userid : " + vo.getUserid());
//		log.info("###--### password : " + vo.getPassword());
//		log.info("###--### username : " + vo.getUsername());
//		log.info("###--### email : " + vo.getEmail());
//		log.info("###--### phone : " + vo.getPhone());
//		log.info("###--### address : " + vo.getAddress());

		// 서비스 작업
		if(service.insert(vo)) {
			return "redirect:/login";
		} else {
			return "regist2";
		}
	}
	// 회원가입 정보를 가져오는 컨트롤러 생성
	// domain => MemberVO(memberTBL)
//	@ResponseBody
//	@PostMapping("/regist2")
//	public String regist2Post(@ModelAttribute("member") MemberVO vo, RedirectAttributes rttr) {
//		log.info("회원가입 요청 " + vo);
//		
//		log.info("중복아이디 검사 " + vo.getUserid());
//		log.info("값 확인 : " + vo);
//		
//		MemberVO vo1 = service.dupId(vo.getUserid()); 
//		log.info("값 확인2 : " + vo1);
//		
//		if(vo.getUserid().equals(vo1.getUserid())) {
//			rttr.addFlashAttribute("overlapError", "중복된 아이디입니다.");
//			return "redirect:regist";
//		} else if(vo1.equals(null)){
//			if(service.insert(vo)) {
//				rttr.addFlashAttribute("pass", "회원가입이 완료되었습니다.");
//				return "redirect:login";
//			}
//		} else {
//			rttr.addFlashAttribute("regiError", "회원가입 오류");
//		}
//		return "redirect:regist";
//	}

//	// 중복 아이디 검사
//	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
//	@PostMapping("/checkId")
//	public String checkId(String userid) {
//		log.info("중복아이디 검사 " + userid);
//		MemberVO vo = service.dupId(userid);
//		if(vo!=null) {
//			return "false";
//		}
//		return "true";
//	}
	
	// 중복 아이디 검사
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/checkId")
	public String checkId(String u_userid) {
		log.info("중복아이디 검사 " + u_userid);
		MemberVO vo = service.dupId(u_userid);
		if(vo!=null) {
			return "false";
		}
		return "true";
	}
	
	// /register, /register2 직접 눌러서 접근하는 경우 - 405에러
	@GetMapping(value={"/regist"})
	public String handleStep() {
		return "redirect:agree";
	}
	
	
	
	
//	// step1에서 약관동의를 한 후 넘어오는 처리
//	@PostMapping("/step2")
//	public String step2Post(boolean agree, RedirectAttributes rttr) {
//		log.info("step2 페이지 요청 " + agree);
//		if(!agree) {
//			rttr.addFlashAttribute("check", "false");
//			// step1 다시 보여주기
//			return "redirect:step1";
//		}
//		// true
//		return "step2";
//	}
	
//	
//	// 회원가입 정보를 가져오는 컨트롤러 생성
//	// domain => MemberVO(memberTBL)
//	@PostMapping("/step3")
//	public String step3Post(@ModelAttribute("member") MemberVO vo) {
//		log.info("회원가입 요청 " + vo);
//		
//		// 서비스 작업
//		if(service.insert(vo)) {
//			return "redirect:/member/login";
//		} else {
//			return "step2";
//		}
//	}
//	

}
