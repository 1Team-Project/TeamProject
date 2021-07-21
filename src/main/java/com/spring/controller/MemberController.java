package com.spring.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CampusUserVO;
import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.service.CampusUserService;

import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j2
public class MemberController {
	
	@Autowired
	private CampusUserService service;
	
	/* 로그인 시스템 시작 */
	/* 기본 시스템 */

//	// login.jsp 보여주기
//	@GetMapping("/login")
//	public void loginGet() {
//		log.info("login 페이지 요청");
//	}
//	
//	// 로그인 정보 가져오기 => post
//	@PostMapping("/loginForm")
//	public String loginPost(CampusUserVO vo, HttpSession session, RedirectAttributes rttr) {
//		log.info("login 요청 : " + vo.getU_userid() + " " + vo.getU_password());
//		CampusUserVO login = service.login(vo);
//		
//		if(login==null) {
//			rttr.addFlashAttribute("error", "아이디 또는 비밀번호를 확인해주세요");
//			return "redirect:login";
//		} else {
//			session.setAttribute("login", login);
//			//session.setAttribute("u_username", vo.getU_username());
//			return "redirect:/";
//		}
//	}
//	
//	// logout => session 해제 후 index 보여주기
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		log.info("logout 요청");		
//		// session.invalidate();
//		session.removeAttribute("login");
//		return "redirect:/";
//	}

	
	/* 기본 시스템 종료*/
	/* security 시작 */

	@GetMapping("/login")
	public String loginGet() {
		log.info("로그인 폼 요청");
		
		return "/login";
	}
	
	@GetMapping("/admin-page")
	public String adminPage() {
		log.info("admin");
		
		return "/AdminPage";
	}
	
	@GetMapping("/user-page")
	public String user() {
		log.info("user");
		
		return "/UserPage";
	}
		
	// 로그인 정보 가져오기 => post
	@PostMapping("/loginForm")
	public String loginPost(CampusUserVO vo, HttpSession session, RedirectAttributes rttr) {
		log.info("login 요청 : " + vo.getU_userid() + " " + vo.getU_password());
		CampusUserVO login = service.login(vo);
		
		if(login==null) {
			rttr.addFlashAttribute("error", "아이디 또는 비밀번호를 확인해주세요");
			return "redirect:login";
		} else {
			session.setAttribute("login", login);
			//session.setAttribute("u_username", vo.getU_username());
			return "redirect:/";
		}
	}
//	
//	
//	@GetMapping("/login-error")
//	public String loginError(Model model) {
//		model.addAttribute("loginError", "아이디나 비밀번호가 올바르지 않습니다.");
//		return "/login";
//	}

	/* 로그인 시스템 종료 */
	
	
	/*마이페이지~구매내역, 예약내역, 회원정보수정*/
	
	//loginMypage 이동
	@GetMapping("/loginMypage")
	public String loginMypage() {
		log.info("마이페이지 요청");
		return "loginMypage";
	}
	
	@PostMapping("/loginMypageForm")
	public String loginMypageForm(CampusUserVO vo) {
		log.info("마이페이지 요청"+vo.getU_userid());
		return "loginMypage";
	}
	
	/*마이페이지 - 회원정보수정*/
	
	//회원정보수정 페이지 이동
	@GetMapping("/mypageModify")
	public String mypageModify() {
		log.info("mypage-modify 페이지 요청");
		
		
		return "mypageModify";
	}//로그인 정보의 로그인, 비밀번호는 가져옴ㅇ
	

	//회원정보수정  - 비밀번호, 주소, 번호, 이메일 수정할 수 있어야 / 가져오는건 비밀번호 제외 다
	@PostMapping("/mypageModify")
	public String mypageModify(HttpSession session,RedirectAttributes rttr) {
		log.info("회원정보수정");
		
		
		
		
//		service.userUpdate(vo);
//		session.invalidate();
		
		return "mypageModify";
	}
	
	//회원탈퇴
//	@PostMapping("/leaveForm")
//	public String leaveForm(CampusUserVO vo, HttpSession session,RedirectAttributes rttr) {
//		log.info("회원탈퇴 요청 " + vo.getU_userid() + " " + vo.getU_password());
//		
//		if(service.leave(vo.getU_userid(), vo.getU_password())) {
//			session.invalidate();
//			return "redirect:/";
//		} else {
//			rttr.addFlashAttribute("error", "비밀번호를 확인해 주세요");
//			return "/leave";
//		}
//	}

	
	/*마이페이지 - 구매내역*/
	@PostMapping("/order")
	public String order() {
		log.info("order페이지 요청");
		
		return "order";
	}
	
	
	
	
	
	/*마이페이지 - 예약내역*/
	@PostMapping("/reservation")
	public String reservation() {
		log.info("reservation 페이지 요청");
		
		return "reservation";
	}
	
	
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