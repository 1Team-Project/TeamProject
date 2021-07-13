package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.LoginVO;
import com.spring.service.MemberService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	/* 로그인 시스템 시작 */
	
	
	// login.jsp 보여주기
	@GetMapping("/login")
	public void loginGet() {
		log.info("login 페이지 요청");
	}
	
	// 로그인 정보 가져오기 => post
	@PostMapping("/loginForm")
	public String loginPost(@ModelAttribute("login") LoginVO vo, HttpSession session, RedirectAttributes rttr) {
		log.info("login 요청 : " + vo.getU_userid() + " " + vo.getU_password());

		LoginVO login = service.login(vo.getU_userid(), vo.getU_password());
		
		if(login==null) {
			rttr.addFlashAttribute("error", "아이디 또는 비밀번호를 확인해주세요");
			return "redirect:login";
		} else {
			session.setAttribute("login", login);
			return "redirect:/";
		}
	}
	
	// logout => session 해제 후 index 보여주기
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("logout 요청");
		
		// session.invalidate();
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	
	/* 로그인 시스템 종료 */
	
//	// member/change-pwd => modify.jsp 보여주기
//	@GetMapping("/change-pwd")
//	public String changPwd() {
//		log.info("비밀번호 수정 페이지 요청");
//		return "/member/modify";
//	}
//		
//	@PostMapping("/change-pwd")
//	public String changePwd(ChangeVO change, HttpSession session, RedirectAttributes rttr) {
//		log.info("비밀번호 수정" + change);
//		
//		if(change.newPasswordEqualsConfirmPassword()) {
//			if(service.update(change)) { // 비밀번호 수정 성공
//				session.invalidate();
//				return "redirect:/member/login";
//			} else { // 현재 비밀번호 오류
//				rttr.addFlashAttribute("error", "현재 비밀번호를 확인해 주세요");
//				return "redirect:/member/change-pwd";
//			}
//		} else { // 변경비밀번호와 확정 변경 비밀번호가 다른 경우
//			rttr.addFlashAttribute("error", "변경 비밀번호가 다릅니다.");
//			return "redirect:/member/change-pwd";
//		}
//	}
	
//	
//	// leave
//	@GetMapping("/leave")
//	public void leave() {
//		log.info("회원탈퇴 폼 요청");
//		
//	}
//	
//	@PostMapping("/leave")
//	public String leavePost(String userid, @RequestParam("current_password") String password, HttpSession session) {
//		log.info("회원탈퇴 요청 " + userid + " " + password);
//		
//		if(service.leave(userid, password)) {
//			session.invalidate();
//			return "redirect:/";
//		} else {
//			return "/member/leave";
//		}
//	}

	
}
