package com.spring.controller;


import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CampusUserVO;
import com.spring.service.CampusUserService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class RegisterController {
	
	@Autowired
	private CampusUserService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@GetMapping("/login2")
	public String login2Get() {
		log.info("아이디 비밀번호 찾기 페이지");
		return "login2";
	}
	
	
	// 회원가입 버튼 누를 시 이동
	@RequestMapping("/agree")
	public void agreeGet() {
		log.info("약관 동의 페이지 요청");
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		log.info("약관 동의 페이지 요청");
		return "mypage";
	}
	
	// 약관 동의 시 이동
	@RequestMapping("/regist")
	public void registerPost() {
		log.info("회원가입 페이지 요청");
	}
	
	
	// 회원가입 정보를 가져오는 컨트롤러 생성
	@PostMapping("/regist2")
	public String regist2Post(CampusUserVO vo) {
		log.info("회원가입 요청 " + vo);
		
		try {
			String pwd = vo.getU_password();
			pwd = pwdEncoder.encode(pwd);
			vo.setU_password(pwd);
			
			if(service.insert(vo)) {
				return "redirect:/login";
			} else {
				return "regist2";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "AccessDenied";
		}

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
	
	// 이메일 인증
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/chkEmail")
	public String chkEmailPost(CampusUserVO vo) {
		log.info("이메일 인증 : " + vo.getU_email());
		Random random = new Random();
		int chkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 확인 : " + chkNum);
		
		// 이메일 보내기
		String setFrom = "campusofficial4@gmail.com";
		String toMail = vo.getU_email();
		// 이메일 제목
		String title = "CampUs 이메일 인증입니다.";
		// 이메일 내용
		String content = "회원가입을 위한 이메일 인증입니다." + "<br><br>" + "인증번호는 " + chkNum + "입니다." + "<br>" + "인증번호를 입력하세요";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		String authKey = Integer.toString(chkNum);
		return authKey;
		
		
	}
	
//	 // /register 직접 눌러서 접근하는 경우 - 405에러
//	@GetMapping(value={"/regist"})
//	public String handleStep() {
//		return "redirect:agree";
//	}
}