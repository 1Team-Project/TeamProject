package com.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	// ȸ������ ��ư ���� �� �̵�
	@PostMapping("/agree")
	public void agreeGet() {
		log.info("��� ���� ������ ��û");
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		log.info("��� ���� ������ ��û");
		return "mypage";
	}
	
	// ��� ���� �� �̵�
	@PostMapping("/regist")
	public void registerPost() {
		log.info("ȸ������ ������ ��û");
	}
	
	
	// ȸ������ ������ �������� ��Ʈ�ѷ� ����
	@PostMapping("/regist2")
	public String regist2Post(CampusUserVO vo) {
		log.info("ȸ������ ��û " + vo);
		
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

	}

	// �ߺ� ���̵� �˻�
	@ResponseBody // ���ϰ��� �ǹ̰� jsp�� ã����� �ǹ̰� �ƴϰ� ������� �ǹ�
	@PostMapping("/checkId")
	public String checkId(String u_userid) {
		log.info("�ߺ����̵� �˻� " + u_userid);
		CampusUserVO vo = service.dupId(u_userid);
		if(vo!=null) {
			return "false";
		}
		return "true";
	}
	
	 // /register ���� ������ �����ϴ� ��� - 405����
	@GetMapping(value={"/regist"})
	public String handleStep() {
		return "redirect:agree";
	}
}