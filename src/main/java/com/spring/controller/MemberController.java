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

@Controller
@Log4j2
public class MemberController {
	
	@Autowired
	private CampusUserService service;
	
	/* �α��� �ý��� ���� */
	/* �⺻ �ý��� */

//	// login.jsp �����ֱ�
//	@GetMapping("/login")
//	public void loginGet() {
//		log.info("login ������ ��û");
//	}
//	
//	// �α��� ���� �������� => post
//	@PostMapping("/loginForm")
//	public String loginPost(CampusUserVO vo, HttpSession session, RedirectAttributes rttr) {
//		log.info("login ��û : " + vo.getU_userid() + " " + vo.getU_password());
//		CampusUserVO login = service.login(vo);
//		
//		if(login==null) {
//			rttr.addFlashAttribute("error", "���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���");
//			return "redirect:login";
//		} else {
//			session.setAttribute("login", login);
//			//session.setAttribute("u_username", vo.getU_username());
//			return "redirect:/";
//		}
//	}
//	
//	// logout => session ���� �� index �����ֱ�
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
//		log.info("logout ��û");		
//		// session.invalidate();
//		session.removeAttribute("login");
//		return "redirect:/";
//	}

	
	/* �⺻ �ý��� ����*/
	/* security ���� */

	@GetMapping("/login")
	public String loginGet() {
		log.info("�α��� �� ��û");
		
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
		
	// �α��� ���� �������� => post
	@PostMapping("/loginForm")
	public String loginPost(CampusUserVO vo, HttpSession session, RedirectAttributes rttr) {
		log.info("login ��û : " + vo.getU_userid() + " " + vo.getU_password());
		CampusUserVO login = service.login(vo);
		
		if(login==null) {
			rttr.addFlashAttribute("error", "���̵� �Ǵ� ��й�ȣ�� Ȯ�����ּ���");
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
//		model.addAttribute("loginError", "���̵� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
//		return "/login";
//	}

	/* �α��� �ý��� ���� */
	
	
	/*����������~���ų���, ���೻��, ȸ����������*/
	
	//loginMypage �̵�
	@GetMapping("/loginMypage")
	public void loginMypage() {
		log.info("���������� ��û");
//		return "loginMypage";
	}
	
	@PostMapping("/loginMypageForm")
	public String loginMypageForm() {
		log.info("���������� ��û");
		return "loginMypage";
	}
	
	/*���������� - ȸ����������*/
	
	//ȸ���������� ������ �̵�
//	@GetMapping("/mypageModify")
//	public String mypageModify(Model model) {
//		log.info("mypage-modify ��û");
//		model.addAttribute("u_username",new CampusUserVO());
//		
//		return "mypageModify";
//	}//�α��� ������ �α���, ��й�ȣ�� �����Ȥ�
	
	//ȸ���������� ������ �̵�
	@GetMapping("/mypageModify")
	public String mypageModify(HttpSession session, Model model) {
		log.info("mypage-modify ��û");
		
		
		return "mypageModify";
	}

	//�α��� ������ �α���, ��й�ȣ�� �����Ȥ�
	
	//ȸ������ �����ϱ� - ��й�ȣ, �ּ�, ��ȣ, �̸��� ������ �� �־�� / �������°� ��й�ȣ ���� ��
	@PostMapping("/mypageModify")
	public String mypageModifyForm(CampusUserVO vo, HttpSession session) {
		log.info("ȸ����������"+vo);
		
		
//		service.userUpdate(vo);
//		session.invalidate();
		
		return "mypageModify";
	}

	
	/*���������� - ���ų���*/
	@GetMapping("/order")
	public String order() {
		log.info("order������ ��û");
		
		return "order";
	}
	
	
	
	
	
	/*���������� - ���೻��*/
	@GetMapping("/reservation")
	public String reservation() {
		log.info("order������ ��û");
		
		return "reservation";
	}
	
	
//	// member/change-pwd => modify.jsp �����ֱ�
//	@GetMapping("/change-pwd")
//	public String changPwd() {
//		log.info("��й�ȣ ���� ������ ��û");
//		return "/member/modify";
//	}
//		
//	@PostMapping("/change-pwd")
//	public String changePwd(ChangeVO change, HttpSession session, RedirectAttributes rttr) {
//		log.info("��й�ȣ ����" + change);
//		
//		if(change.newPasswordEqualsConfirmPassword()) {
//			if(service.update(change)) { // ��й�ȣ ���� ����
//				session.invalidate();
//				return "redirect:/member/login";
//			} else { // ���� ��й�ȣ ����
//				rttr.addFlashAttribute("error", "���� ��й�ȣ�� Ȯ���� �ּ���");
//				return "redirect:/member/change-pwd";
//			}
//		} else { // �����й�ȣ�� Ȯ�� ���� ��й�ȣ�� �ٸ� ���
//			rttr.addFlashAttribute("error", "���� ��й�ȣ�� �ٸ��ϴ�.");
//			return "redirect:/member/change-pwd";
//		}
//	}
	
//	
//	// leave
//	@GetMapping("/leave")
//	public void leave() {
//		log.info("ȸ��Ż�� �� ��û");
//		
//	}
//	
//	@PostMapping("/leave")
//	public String leavePost(String userid, @RequestParam("current_password") String password, HttpSession session) {
//		log.info("ȸ��Ż�� ��û " + userid + " " + password);
//		
//		if(service.leave(userid, password)) {
//			session.invalidate();
//			return "redirect:/";
//		} else {
//			return "/member/leave";
//		}
//	}

	
}