package com.spring.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardTopVO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
import com.spring.domain.CampusProductOptionVO;
import com.spring.domain.CampusProductVO;
import com.spring.domain.CampusReplyPageVO;
import com.spring.domain.CampusReplyVO;
import com.spring.service.CampusBoardService;
import com.spring.service.CampusProductService;
import com.spring.service.CampusReplyService;

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
public class BoardController {
	

	@Autowired
	private CampusBoardService service;

	@Autowired
	private CampusReplyService reply;
	
	@Autowired
	private CampusProductService product;

	@GetMapping("/list")
	public void list(Model model, CampusCriteria cri) {
		
		log.info("��ü ����Ʈ ��ȸ");
		//����Ʈ ��ȸ
		List<CampusBoardVO> list = service.list(cri);
		int total = service.total(cri);

		//list �̸����� ��ȸ�� �ڷ� �𵨿� ��� (����Ʈ �ѷ��ֱ�)
		model.addAttribute("list", list);

		List<CampusBoardTopVO> top = new ArrayList<CampusBoardTopVO>();
		
		//������ ȭ����

		List<CampusBoardVO> datelist = service.topdate();
		int rank = 0;
		String imgurl = "";
		for(CampusBoardVO vo:datelist) {
			rank ++;
			
			List<CampusAttachFileDTO> dto = service.getAttachList(vo.getB_no());
			
			if (dto == null || dto.isEmpty()) {
				imgurl = "/resources/main/images/default-img.jpg";
			}else {
				for(CampusAttachFileDTO ddto:dto) {
					String path = ddto.getA_path().replace("\\", "%5C");
					log.info("url �׽�Ʈ�� : "+path);
					imgurl = "/display?fileName="+path+"%2F"+ddto.getA_uuid()+"_"+ddto.getA_name();
					break;
				}
			}
			
			CampusBoardTopVO tovo = new CampusBoardTopVO();
			if (vo.getB_content().length() >= 15) {						
				tovo.setB_content_15(vo.getB_content().substring(0, 14));					
			}else {
				tovo.setB_content_15(vo.getB_content());											
			}
			if (vo.getB_title().length() >= 10) {
				tovo.setB_title_10(vo.getB_title().substring(0, 9));						
			}else {
				tovo.setB_title_10(vo.getB_title());
			}
			tovo.setB_no(vo.getB_no());
			tovo.setUrllink(imgurl);
			tovo.setRank(rank);
			
			top.add(tovo);

			log.info("�׽�Ʈ Ȯ�� �׽�Ʈ Ȯ�� : "+top);
		}
		if (rank <= 2) {
			for(int i = 1; i <= 3-rank; i++) {				
				CampusBoardTopVO tovo = new CampusBoardTopVO();
				tovo.setB_title_10("������ ȭ����!");
				tovo.setB_content_15("������ ȭ������ �����ϴ�!");
				tovo.setRank(999);
				tovo.setUrllink("/resources/main/images/default-img.jpg");
				top.add(tovo);
			}
		}
		
		//������ ȭ����
		model.addAttribute("CampusTopVO", top);
		
		//������ ������
		CampusPageVO campusPageVO = new CampusPageVO(cri, total);
		
		//������ ������ ����
		model.addAttribute("CampusPageVO", campusPageVO);
	}
	

	@PostMapping("/viewadd")
	@ResponseBody
	public String read2(@RequestBody String bnoval) {
		
		log.info("�� �ֵ� �׽�Ʈ");
		log.info(bnoval);
		int b_no = Integer.parseInt(bnoval);
		log.info("int ó���� bno"+b_no);
		//���� ��ȸ���� ������
		CampusBoardVO campusVO=service.view(b_no);
		//+1 �� ���·� �Է�
		int views = campusVO.getB_views()+1;
		log.info("views �� : "+views);
		String viewsS = Integer.toString(views);

		return viewsS;
	}
	
	@GetMapping("/view")
	public void read(int b_no,int b_views, int r_page,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("�� �ϳ� �������� "+b_no+" cri : "+cri);  
		
		CampusBoardVO campusVO=service.view(b_no);
		int views = campusVO.getB_views();
		
		//����, ��ȸ���� +1�� �ƴ� ���Ƿ� ������ �ٲ�����, ����
		if (b_views - views == 1 || b_views == 1){			
			service.addview(b_views, b_no);
		}
		
		List<CampusReplyVO> replyVO = reply.list(r_page, b_no);

		model.addAttribute("campusVO", campusVO);
		int countreply = reply.getCountByBno(b_no);
		CampusReplyPageVO campusReplyPageVO = new CampusReplyPageVO(r_page, countreply);
		model.addAttribute("replyVO", replyVO);
		model.addAttribute("campusReplyPageVO", campusReplyPageVO);
		model.addAttribute("r_page",r_page);
		
	}
	
	@GetMapping("/modify")
	public void modify(int b_no,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("�� ���� "+b_no+" cri : "+cri);  
		
		CampusBoardVO campusVO=service.view(b_no);
		model.addAttribute("campusVO", campusVO);
	}
	
	@PostMapping("/modify")
	public String modifyPost(CampusBoardVO vo, CampusCriteria cri, RedirectAttributes rttr) {
		
		log.info("�� ����"+cri);

		//÷�� ���� Ȯ��
		if(vo.getAttachList()!=null) {
			vo.getAttachList().forEach(attach -> log.info(""+attach));
		}
		
		if(service.update(vo)) {
			rttr.addFlashAttribute("result", "����");
			
			rttr.addAttribute("sort",cri.getSort());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("page",cri.getPage());
			
			return "redirect:list"; // redirect:/board/list
		}else {
			return "redirect:modify?b_no="+vo.getB_no()+"&page="+cri.getPage()+"&keyword="+cri.getKeyword()+"&sort="+cri.getSort();
		}
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

	@PostMapping("/remove")
	public String remove(int b_no, String writer, CampusCriteria cri, RedirectAttributes rttr) {
		
		log.info("���� ��û   "+b_no);
		
		//������ ����� ÷������ ����
		//1. bno�� �ش�Ǵ� ÷������ ��� �˾Ƴ���
		List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
		
		//�Խñ� ���� + ÷������ ����
		if(service.delete(b_no)) {

			//2. ���� ���� ����
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "����");
			
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("sort",cri.getSort());
			
			return "redirect:list";
		}else {
			return "redirect:modify?b_no="+b_no+"&page="+cri.getPage()+"&keyword="+cri.getKeyword()+"&sort="+cri.getSort();
		}
		
		
	}
	
	@PostMapping("/replyadd")
	public String replyadd(int b_no, int b_views, CampusReplyVO vo, CampusCriteria cri) {
		
		log.info("��� �ۼ�  "+vo);
		
		if(reply.insert(vo)) {
			log.info("��� �ۼ� ��û : "+vo.getB_no());
			
			int replycnt = reply.getCountByBno(b_no);
			
			service.replyadd(b_no, replycnt);
	
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&r_page=1&b_views="+b_views+"&b_no="+b_no;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&r_page=1&b_views="+b_views+"&b_no="+b_no;
		}
		
	}
	
	@PostMapping("/replymodify")
	public String replymodify(int b_no, int b_views, int r_page, CampusReplyVO vo, CampusCriteria cri) {
		
		log.info("��� ���� "+vo);
		
		if(reply.update(vo)) {
			log.info("��� ���� ��û : "+vo.getB_no());

			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}
		
	}
	
	
	@PostMapping("/replyremove")
	public String replyremove(int b_no, int b_views, int r_page, CampusReplyVO vo, CampusCriteria cri) {
		
		log.info("��� ���� "+vo);
		
		if(reply.delete(vo.getR_no())) {
			log.info("��� ���� ��û : "+vo.getB_no()+" / "+vo.getR_no());
			
			int replycnt = reply.getCountByBno(b_no);
			
			service.replyadd(b_no, replycnt);

			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}
		
	}
	
	
	@GetMapping("/sellwrite")
	public void sellwrite() {
		log.info("�Ǹ� �̵�");
	}
	
	@PostMapping("/sellwrite")
	public String sellwritePost(CampusProductVO vo, CampusProductOptionVO voo, CampusBoardVO vob,RedirectAttributes rttr) {
		log.info("�Ǹ� ��� ��û");
		
		//po_optiontitle �� ���� �������� (productoption ���̺��� optiontitle)
		//product �� option���� ���� �ȵ����� ������, ������ ���� ����־���.
		if (voo.getPo_optiontitle() != null && voo.getPo_optiontitle() != "") {
			vo.setP_option(voo.getPo_optiontitle());
		//����ó�� (�̻��ϰ� ������ ���)
		}else if(voo.getPo_option1() != null || voo.getPo_option2() != null || voo.getPo_option3() != null){
			voo.setPo_option1("-");
			voo.setPo_option2("-");
			voo.setPo_option3("-");
		}
		if (voo.getPo_optiontitle() == null || voo.getPo_optiontitle() == "") {
			vo.setP_option("-");
			voo.setPo_optiontitle("-");
		}
		//����ó�� (null ���޾ƿ� ��� ���)
		if (voo.getPo_option1() == null && voo.getPo_option1() == "") {
			voo.setPo_option1("-");
		}
		if (voo.getPo_option2() == null && voo.getPo_option2() == "") {
			voo.setPo_option2("-");
		}
		if (voo.getPo_option3() == null && voo.getPo_option3() == "") {
			voo.setPo_option3("-");
		}
		
		//������ ���������� ���Գ� Ȯ�ο�
		log.info("productVO �׽�Ʈ : "+vo);
		log.info("productVO (option) �׽�Ʈ : "+voo);
		log.info("productVO (board) �׽�Ʈ : "+vob);
		
		//board => b_no, b_content �ֱ�
		//option => p_number, po_optiontitle, po_option1,2,3
		//category => pc_code, pc_name
		//product => p_name, p_price, p_option, p_stock, pc_code
		
		if(product.insertProduct(vo, voo, vob)) {
			rttr.addFlashAttribute("result",vob.getB_no());
			return "redirect:list";
		}else {
			return "redirect:list";
		}

	}

	@GetMapping("/sellmodify")
	public void sellmodify(int p_number, int b_no, Model model) {
		log.info("��ǰ ���� "+p_number);  
		
		CampusProductVO campusProductVO = product.viewProduct(p_number);
		CampusBoardVO campusBoardVO = service.view(b_no);
		model.addAttribute("campusBoardVO", campusBoardVO);
		model.addAttribute("campusProductVO", campusProductVO);
	}
	
	@PostMapping("/sellmodify")
	public String sellmodifyPost(CampusProductVO vo) {
		
		log.info("��ǰ ����");

		if(product.updateProduct(vo.getP_price(), vo.getP_stock(), vo.getP_number())) {
			return "redirect:list";
		}else {
			return "redirect:index";
		}
	}
	
	@PostMapping("/sellremove")
	public String sellremove(int b_no, int p_number, RedirectAttributes rttr) {
		
		log.info("��ǰ ���� ��û   "+b_no);
		
		//������ ����� ÷������ ����
		//1. bno�� �ش�Ǵ� ÷������ ��� �˾Ƴ���
		List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
		
		//�Խñ� ���� + ÷������ ����
		if(product.deleteProduct(p_number, b_no)) {
			
			//2. ���� ���� ����
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "����");

			return "redirect:list";
		}else {
			return "redirect:index";
		}
		
		
	}
	
	
	//÷�ι� ��������
	@GetMapping("/getAttachList")
	public ResponseEntity<List<CampusAttachFileDTO>> getAttachList(int b_no){
		log.info("÷�ι� �������� "+b_no);
		
		return new ResponseEntity<List<CampusAttachFileDTO>>(service.getAttachList(b_no),HttpStatus.OK);
	}
	
	private void deleteFiles(List<CampusAttachFileDTO> attachList) {
		log.info("÷������ ���� ��û "+attachList);
		
		if(attachList == null || attachList.size()<=0) {
			return;
		}
		
		for(CampusAttachFileDTO dto:attachList) {
			Path path = Paths.get("c:\\CampusIMG\\",dto.getA_path()+"\\"+dto.getA_uuid()+"_"+dto.getA_name());
			try {
				Files.deleteIfExists(path);

				Path thumbnail = Paths.get("c:\\CampusIMG\\",
						dto.getA_path()+"\\s_"+dto.getA_uuid()+"_"+dto.getA_name());
				Files.delete(thumbnail);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
}