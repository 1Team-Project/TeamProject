package com.spring.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CampusAuthVO;
import com.spring.domain.CampusCustomUser;
import com.spring.domain.CampusUserVO;
import com.spring.domain.ChangeVO;
import com.spring.service.CampusUserService;

import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j2
public class MemberController {
	
	@Autowired
	private CampusUserService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
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

	@RequestMapping("/login")
	public String loginGet() {
		log.info("로그인 폼 요청");
		
		return "/login";
	}
	
	// logout => session 해제 후 index 보여주기
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("logout 요청");		
		// session.invalidate();
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	// 로그인 아이디 검사
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/checkUser")
	public String checkUser(CampusUserVO vo) {
		log.info("회원 아이디, 비밀번호 검사 : " + vo.getU_userid() + " " + vo.getU_password());
		CampusUserVO vo1 = service.dupId(vo.getU_userid());
		if(vo1!=null) {
			log.info("아이디 비밀번호 확인 : " + vo.getU_userid() + " " + vo.getU_password());
			if(service.login(vo)!=null) {
				return "true";
			}
		}
		return "false";
	}
	
	// 아이디 찾기
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/findUser")
	public String findUser(CampusUserVO vo) {
		log.info("회원 이름 검사 : " + vo.getU_username());
		log.info("회원 번호 검사 : " + vo.getU_email());
		
		CampusUserVO vo1 = service.findId(vo);

		log.info("값 확인 : " + vo1);
		if(vo1!=null) {
			return "true";
		}
		return "false";
	}
	
	@PostMapping("/printId")
	public String printId(CampusUserVO vo, Model model) {
		log.info("printId 확인");
		log.info("회원 이름 검사 : " + vo.getU_username());
		log.info("회원 번호 검사 : " + vo.getU_phone());
		
		CampusUserVO vo1 = service.findId(vo);
		
		model.addAttribute("findId", vo1);
		
		return "login2";
		
	}
	
	// 비밀번호 찾기
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/findUserPw")
	public String findUserPw(CampusUserVO vo) {
		log.info("회원 아이디 검사 : " + vo.getU_userid());
		log.info("회원 이름 검사 : " + vo.getU_username());
		log.info("회원 번호 검사 : " + vo.getU_email());
		
		CampusUserVO vo1 = service.findPw(vo);

		log.info("값 확인 : " + vo1);
		if(vo1!=null) {
			return "true";
		}
		return "false";
	}
	
	@PostMapping("/changePw")
	public String printPw(CampusUserVO vo, HttpSession session, Model model) {
		log.info("printPw 확인");
		
		log.info("회원 아이디 검사 : " + vo.getU_userid());
		log.info("회원 이름 검사 : " + vo.getU_username());
		log.info("회원 번호 검사 : " + vo.getU_phone());
		
		CampusUserVO vo1 = service.findId(vo);
		
		model.addAttribute("findId", vo1);
		
		return "/changePw";
		
	}
	
	
	
	// 로그인 가능 검사
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/checkLogin")
	public String checkLogin(CampusUserVO vo, Authentication authentication) {
		log.info("회원 아이디, 비밀번호 검사 : " + vo.getU_userid() + " " + vo.getU_password());
		
		Object authDoc = authentication.getPrincipal();
		CampusCustomUser userAuth = (CampusCustomUser)authDoc;
		String chk_pass = userAuth.getCampusUser().getU_password();
		
		vo.setU_password(chk_pass);
		
		CampusUserVO vo1 = service.login(vo);
		if(vo1!=null) {
			log.info("아이디 비밀번호 확인 : " + vo.getU_userid() + " " + vo.getU_password());
			if(service.login(vo)!=null) {
				return "true";
			}
		}
		return "false";
	}
		
	// 로그인 정보 가져오기 => post ======> 시큐리티가 자동으로 해줌
//	@PostMapping("/loginForm")
//	public String loginPost(CampusUserVO vo, HttpSession session, RedirectAttributes rttr) {
//		log.info("login 요청 : " + vo.getU_userid() + " " + vo.getU_password());
//		log.info("login 요청 테스트"+vo);
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
	@GetMapping("/myModify")
	public String myModify() {
		log.info("mypage-modify 페이지 요청");
		
		
		return "myModify";
	}//로그인 정보의 로그인, 비밀번호는 가져옴ㅇ
	
	
	// 회원정보수정  - 비밀번호만 변경
	@PostMapping("/updatePw")
	public String updatePw(CampusUserVO vo, HttpSession session, RedirectAttributes rttr) {
		log.info("값 확인 : " + vo);
		try {
			String pwd = vo.getU_password();
			pwd = pwdEncoder.encode(pwd);
			vo.setU_password(pwd);
			
			int vo1 = service.updatePw(vo);
			log.info("비번 교체 확인 : " + vo1);
			if(vo1==1) {
				return "redirect:login";
			} else {
				return "login2";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "AccessDenied";
		}

	}
		
	//회원정보수정  - 비밀번호, 주소, 번호, 이메일 수정할 수 있어야 / 가져오는건 비밀번호 제외 다
	@PostMapping("/myModify")
	public String myModify(CampusUserVO vo, HttpSession session,RedirectAttributes rttr, Authentication Authentication) {
//		log.info("회원정보수정");
//		
//		Object authDoc = Authentication.getPrincipal();
//		CampusCustomUser userAuth = (CampusCustomUser)authDoc;
//		String chk_pass = userAuth.getCampusUser().getU_password();
//		
//		vo.setU_password(chk_pass);
//		
//		log.info("vo 아이디 확인 : " + vo.getU_userid());
//		log.info("vo 비밀번호 확인 : " + vo.getU_password());
//		
//		if(service.update(vo)) { // 비밀번호 수정 성공
//			session.invalidate();
//			return "redirect:/login";
//		} else { // 현재 비밀번호 오류
//			rttr.addFlashAttribute("error", "정보 변경 실패");
//			return "redirect:/myModify";
//		}
		
		try {
			String pwd = vo.getNew_password();
			pwd = pwdEncoder.encode(pwd);
			vo.setU_password(pwd);
			
			log.info("vo 아이디 확인 : " + vo.getU_userid());
			log.info("vo 비밀번호 확인 : " + vo.getU_password());
			
			if(service.update(vo)) { // 비밀번호 수정 성공
				session.invalidate();
				return "/loginMypage";
			} else { // 현재 비밀번호 오류
				rttr.addFlashAttribute("error", "정보 변경 실패");
				return "redirect:/myModify";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "AccessDenied";
		}
		
//		service.userUpdate(vo);
//		session.invalidate();
		
	}
//	//회원정보수정 페이지 이동
//	@GetMapping("/mypageModify")
//	public String mypageModify() {
//		log.info("mypage-modify 페이지 요청");
//		
//		
//		return "mypageModify";
//	}//로그인 정보의 로그인, 비밀번호는 가져옴ㅇ
//	
//
//	//회원정보수정  - 비밀번호, 주소, 번호, 이메일 수정할 수 있어야 / 가져오는건 비밀번호 제외 다
//	@PostMapping("/mypageModify")
//	public String mypageModify(ChangeVO vo, HttpSession session,RedirectAttributes rttr) {
//		log.info("회원정보수정");
//		
//		if(vo.newPasswordEqualsConfirmPassword()) {
//			if(service.update(vo)) { // 비밀번호 수정 성공
//				session.invalidate();
//				return "redirect:/login";
//			} else { // 현재 비밀번호 오류
//				rttr.addFlashAttribute("error", "현재 비밀번호를 확인해 주세요");
//				return "redirect:/mypageModify";
//			}
//		} else { // 변경비밀번호와 확정 변경 비밀번호가 다른 경우
//			rttr.addFlashAttribute("error", "변경 비밀번호가 다릅니다.");
//			return "redirect:/mypageModify";
//		}
//	
////		service.userUpdate(vo);
////		session.invalidate();
//		
//	}

	// leave
//	@GetMapping("/leave")
//	public String leaveGet() {
//		log.info("회원탈퇴 폼 요청");
//		return "/leave";
//	}
	@RequestMapping("/leave")
	public String leaveGet(CampusUserVO vo, HttpSession session, Model model) {
		log.info("회원탈퇴 폼 요청");
		
		log.info("세션 값 확인 : " + vo.getU_userid());
		
		if(vo.getU_userid()==null) {
			return "/leave";
		} else {
			CampusUserVO userS = service.read(vo); 
			model.addAttribute("userS", userS);
			return "/leave";
		}
	}
	
	
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(CampusUserVO vo, HttpSession session, Authentication authentication) {
		log.info("회원 확인 : " + vo);
		int result;
		if(service.dupId(vo.getU_userid())!=null) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/leaveCo")
	public String leaveCoPost(Model model, HttpSession session, CampusUserVO vo, CampusAuthVO auth) {
		log.info("회원 강제 탈퇴 요청 : " + vo.getU_userid());
		log.info("회원 강제 탈퇴 요청 : " + auth.getU_userid());
		
		if(service.dupId(vo.getU_userid())!=null) {
			boolean flag = false;
			if(service.leaveAuth(vo)) {
				session.invalidate();
				log.info("권한 삭제 확인 true 1, false 0 : " + service.leaveAuth(vo));
				flag = true;
			} else {
				return "/leave";
			}
			if(flag) {
				service.leaveCampAdmin(vo);
				log.info("정보 삭제 확인 true 1, false 0 : " + service.leaveCampAdmin(vo));
				return "/main";
			} else {
				return "/leave";
			}
		}
		return "/leave";
	}
	
	@ResponseBody
	@PostMapping("/pwdCheck")
	public int pwdCheck(CampusUserVO vo, HttpSession session, Authentication authentication) {
		
		Object authDoc = authentication.getPrincipal();
		CampusCustomUser userAuth = (CampusCustomUser)authDoc;
		String chk_pass = userAuth.getCampusUser().getU_password();

		log.info("값 확인 : " + chk_pass);
		
		log.info("비밀번호 확인 : " + vo.getU_userid() + " " + vo.getU_password());

	
		pwdEncoder = new BCryptPasswordEncoder();
		log.info("비교값 확인 : " + pwdEncoder.matches(vo.getU_password(), chk_pass));
		int result;
		if(pwdEncoder.matches(vo.getU_password(), chk_pass)) {
			result = 1;
		} else {
			result = 0;
		}
		log.info("비밀번호 같으면 1 아니면 0 : " + result);
		return result;
	}
	
	@PostMapping("/leaveForm")
	public String leavePost(CampusUserVO vo, HttpSession session, Authentication authentication) {
		log.info("회원탈퇴 요청 " + vo.getU_userid() + " 회원탈퇴 비밀번호 : " + vo.getU_password());
		
		Object authDoc = authentication.getPrincipal();
		CampusCustomUser userAuth = (CampusCustomUser)authDoc;
		String chk_pass = userAuth.getCampusUser().getU_password();
		
		if(pwdEncoder.matches(vo.getU_password(), chk_pass)) {
			vo.setU_password(chk_pass);
			boolean flag = false;
			
			if(service.leaveAuth(vo)) {
				session.invalidate();
				log.info("권한 삭제 확인 true 1, false 0 : " + service.leaveAuth(vo));
				flag = true;
			} else {
				return "/leave";
			}
			if(flag) {
				service.leaveCamp(vo);
				log.info("정보 삭제 확인 true 1, false 0 : " + service.leaveCamp(vo));
				return "redirect:/";
			} else {
				return "/leave";
			}
		}
		return "/leave";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/userManagement")
	public String userManagement(Model model, CampusAuthVO auth, CampusUserVO vo, HttpSession session) {
		log.info("회원관리 페이지");
		log.info("회원 리스트 요청");

		List<CampusAuthVO> userAuth = service.userAuth(auth);
		model.addAttribute("userAuth", userAuth);

		return "userManagement";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/userInfo")
	public String userListPost(Model model, HttpSession session, CampusUserVO vo, CampusAuthVO auth) {
		log.info("회원 정보 요청 userList");
		log.info("회원 아이디 : " + vo.getU_userid());
		
		auth.setU_userid(vo.getU_userid());
		
		CampusUserVO userS = service.read(vo);
		
		CampusAuthVO userA = service.userAuthOne(auth);
		

		model.addAttribute("userS", userS);
		model.addAttribute("userA", userA);
		
		log.info("userS 확인 : " + userS);
		log.info("userA 확인 : " + userA);
		
		return "userInfo";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/userCheck")
	public String userCheck(CampusUserVO vo, HttpSession session) {
		log.info("회원 아이디 검사 : " + vo.getU_userid());
		CampusUserVO vo1 = service.dupId(vo.getU_userid());
		if(vo1!=null) {
			log.info("아이디 확인 : " + vo.getU_userid());
			if(service.read(vo)!=null) {
				return "true";
			}
		}
		return "false";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody // 리턴값의 의미가 jsp를 찾으라는 의미가 아니고 결과값의 의미
	@PostMapping("/authCheck")
	public String authCheck(CampusAuthVO auth, HttpSession session) {
		log.info("회원 아이디 검사 : " + auth.getU_userid());
		CampusAuthVO temp = service.userAuthOne(auth);
		if(temp!=null) {
			log.info("아이디 확인 : " + temp.getU_userid());
			log.info("권한 확인 : " + temp.getU_auth());
			return "true";
		}
		return "false";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/authUpdate")
	public String authUpdatePost(CampusAuthVO auth, HttpSession session) {
		log.info("회원 아이디 및 권한 검사 : " + auth.getU_userid() + " " + auth.getU_auth());
		log.info("권한 넣기 확인 : " + service.authModify(auth));
		service.authModify(auth);
		log.info("권한 변경 확인 : " + service.userAuthOne(auth));
		
		return "redirect:userManagement";
	}
	
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