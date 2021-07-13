package com.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		log.info("��ü ����Ʈ ��ȸ");
		List<CampusBoardVO> list = service.list(cri);
		int total = service.total(cri);
		
		
		model.addAttribute("list", list);
		CampusPageVO campusPageVO = new CampusPageVO(cri, total);
		model.addAttribute("CampusPageVO", campusPageVO);
	}
	

	@PostMapping("/viewadd")
	@ResponseBody
	public String read2(@RequestBody String bnoval) {
		
		log.info("�� �ֵ� �׽�Ʈ");
		log.info(bnoval);
		int b_no = Integer.parseInt(bnoval);
		log.info("int ó���� bno"+b_no);
		CampusBoardVO campusVO=service.view(b_no);
		int views = campusVO.getB_views()+1;
		log.info("views �� : "+views);
		String viewsS = Integer.toString(views);

		return viewsS;
	}
	
	@GetMapping("/view")
	public void read(int b_no,int b_views,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("�� �ϳ� �������� "+b_no+" cri : "+cri);  
		
		CampusBoardVO campusVO=service.view(b_no);
		int views = campusVO.getB_views();
		
		if (b_views - views == 1 || b_views == 1){			
			service.addview(b_views, b_no);
		}
		
		model.addAttribute("campusVO", campusVO);
		
	}
	
	@GetMapping("/modify")
	public void modify(int b_no,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("�� ���� "+b_no+" cri : "+cri);  
		
		CampusBoardVO campusVO=service.view(b_no);
		model.addAttribute("campusVO", campusVO);
	}

	//@PreAuthorize("isAuthenticated()") //@PreAuthorize("hasAnyAuthority('ROLE_USER')")
	@GetMapping("/write")
	public void register() {
		log.info("���� ��� �� ��û");
	}
	
	@PostMapping("/write")
	public String registerPost(CampusBoardVO vo, RedirectAttributes rttr) {
		
		log.info("�� �ۼ�  "+vo);
		
		if(service.insert(vo)) {
			log.info("�� �ۼ� ��û : "+vo.getB_no()+" /// "+vo.getAttachList());
			rttr.addFlashAttribute("result",vo.getB_no());
			return "redirect:list";
		}else {
			return "redirect:register";
		}
		
	}
	
	@GetMapping("/sellwrite")
	public void sellwrite() {
		log.info("�Ǹ� ��� �̵� ����");
	}
	
	@GetMapping("/sellmodify")
	public void sellmodify() {
		log.info("�Ǹ� ���� �̵� ����");
	}
	
}
