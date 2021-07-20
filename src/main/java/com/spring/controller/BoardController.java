package com.spring.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
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

import lombok.extern.log4j.Log4j2;

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
		log.info("�ءءءء� list �ءءءء�");  

		//������ ȭ����
		List<CampusBoardTopVO> top = new ArrayList<CampusBoardTopVO>();
		
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
			
			//������ ȭ���� ����/������ ��� ���� 10/15�� ��ŭ �ڸ���
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
		}
		//����, ���� �� ���� 3�� �̸��� ���, �� ������ �ø���
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
		
		//��ü ����Ʈ ��ȸ �� �𵨿� ���
		List<CampusBoardVO> list = service.list(cri);
		int total = service.total(cri);
		model.addAttribute("list", list);
		
		//������ ȭ���� �� �𵨿� ���
		model.addAttribute("CampusTopVO", top);
		
		//������ ������ �� �𵨿� ���
		CampusPageVO campusPageVO = new CampusPageVO(cri, total);
		model.addAttribute("CampusPageVO", campusPageVO);
	}
	

	@PostMapping("/viewadd")
	@ResponseBody
	public String read2(@RequestBody String bnoval) {
		log.info("�ءءءء� view add �ءءءء�");  
		
		//bno �� �����ͼ�, int������ ĳ����
		int b_no = Integer.parseInt(bnoval);

		//���� ��ȸ���� ������
		CampusBoardVO campusVO=service.view(b_no);
		
		//+1 �� ���·� �Է�
		int views = campusVO.getB_views()+1;

		//�ٽ� String ���·� ��ȯ�Ͽ� ����
		String viewsS = Integer.toString(views);
		return viewsS;
	}
	
	@GetMapping("/view")
	public void read(int b_no,int b_views, int r_page,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("�ءءءء� view �ءءءء�");  
		
		//��ȸ�� ��������
		CampusBoardVO campusVO=service.view(b_no);
		int views = campusVO.getB_views();
		
		//����, ��ȸ���� +1�� �ƴ� ���Ƿ� ������ �ٲ������� �ö󰡴� ���� ����
		if (b_views - views == 1 || b_views == 1){			
			service.addview(b_views, b_no);
		}
		
		//��� ����
		List<CampusReplyVO> replyVO = reply.list(r_page, b_no);

		int countreply = reply.getCountByBno(b_no);
		CampusReplyPageVO campusReplyPageVO = new CampusReplyPageVO(r_page, countreply);
		
		//�𵨿� �� ���
		model.addAttribute("campusVO", campusVO);
		model.addAttribute("replyVO", replyVO);
		model.addAttribute("campusReplyPageVO", campusReplyPageVO);
		model.addAttribute("r_page",r_page);
		
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void modify(int b_no,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("�ءءءء� get modify �ءءءء�");  
		
		//�� �ϳ��� ���� �� �𵨿� ���
		CampusBoardVO campusVO=service.view(b_no);
		model.addAttribute("campusVO", campusVO);
	}
	
	@PreAuthorize("principal.username == #vo.b_writer")
	@PostMapping("/modify")
	public String modifyPost(CampusBoardVO vo, CampusCriteria cri, RedirectAttributes rttr) {
		
		log.info("�ءءءء� post modify �ءءءء�");  

		//÷�� ���� Ȯ��
		if(vo.getAttachList()!=null) {
			vo.getAttachList().forEach(attach -> log.info(""+attach));
		}
		
		//�� ���� ������
		if(service.update(vo)) {
			rttr.addFlashAttribute("result", "����");
			
			rttr.addAttribute("sort",cri.getSort());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("page",cri.getPage());
			
			return "redirect:list";
		//�� ���� ���н�
		}else {
			return "redirect:modify?b_no="+vo.getB_no()+"&page="+cri.getPage()+"&keyword="+cri.getKeyword()+"&sort="+cri.getSort();
		}
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public void write() {
		log.info("�ءءءء� get write �ءءءء�");  
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/write")
	public String writePost(CampusBoardVO vo, RedirectAttributes rttr) {
		
		log.info("�ءءءء� post write �ءءءء�");  
		
		//�� �ۼ� ��û �� ����/���н�
		if(service.insert(vo)) {
			rttr.addFlashAttribute("result",vo.getB_no());
			return "redirect:list";
		}else {
			return "redirect:register";
		}
		
	}
	@PreAuthorize("principal.username == #b_writer")
	@PostMapping("/remove")
	public String remove(int b_no, String b_writer, CampusCriteria cri, RedirectAttributes rttr) {
		
		log.info("�ءءءء� post remove �ءءءء�");  
		
		//bno�� �ش�Ǵ� ÷������ ��� �˾Ƴ���
		List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
		
		//������ �Խñ� ���� + ÷������ ����
		if(service.delete(b_no)) {

			//���� ���� ����
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
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/replyadd")
	public String replyadd(int b_no, int b_views, CampusReplyVO vo, CampusCriteria cri) {
		
		log.info("�ءءءء� post replyadd �ءءءء�");  
		
		//��� ��� ������
		if(reply.insert(vo)) {
			
			int replycnt = reply.getCountByBno(b_no);
			
			service.replyadd(b_no, replycnt);
	
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&r_page=1&b_views="+b_views+"&b_no="+b_no;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&r_page=1&b_views="+b_views+"&b_no="+b_no;
		}
		
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/replymodify")
	public String replymodify(int b_no, int b_views, int r_page, CampusReplyVO vo, CampusCriteria cri) {
		
		log.info("�ءءءء� post replymodify �ءءءء�");  
		
		//��� ���� ��û
		if(reply.update(vo)) {

			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/replyremove")
	public String replyremove(int b_no, int b_views, int r_page, CampusReplyVO vo, CampusCriteria cri) {
		
		log.info("�ءءءء� post replyremove �ءءءء�");  
		
		//��� ���� ��û
		if(reply.delete(vo.getR_no())) {
			
			int replycnt = reply.getCountByBno(b_no);
			
			service.replyadd(b_no, replycnt);

			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}
		
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@GetMapping("/sellwrite")
	public void sellwrite() {
		log.info("�ءءءء� get sellwrite �ءءءء�");
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@PostMapping("/sellwrite")
	public String sellwritePost(CampusProductVO vo, CampusProductOptionVO voo, CampusBoardVO vob,RedirectAttributes rttr) {
		log.info("�ءءءء� post sellwrite �ءءءء�");  
		
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
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@GetMapping("/sellmodify")
	public void sellmodify(int p_number, int b_no, Model model) {
		log.info("�ءءءء� get sellmodify �ءءءء�");
		
		//��ǰ ����, �Խñ�(��ǰ) ���� ��������
		CampusProductVO campusProductVO = product.viewProduct(p_number);
		CampusBoardVO campusBoardVO = service.view(b_no);
		model.addAttribute("campusBoardVO", campusBoardVO);
		model.addAttribute("campusProductVO", campusProductVO);
	}
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@PostMapping("/sellmodify")
	public String sellmodifyPost(CampusProductVO vo) {
		log.info("�ءءءء� post sellmodify �ءءءء�");

		//�����ϱ�
		if(product.updateProduct(vo.getP_price(), vo.getP_stock(), vo.getP_number())) {
			return "redirect:list";
		}else {
			return "redirect:index";
		}
	}
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@PostMapping("/sellremove")
	public String sellremove(int b_no, int p_number, RedirectAttributes rttr) {
		log.info("�ءءءء� post sellremove �ءءءء�");
		
		//bno�� �ش�Ǵ� ÷������ ��� �˾Ƴ���
		List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
		
		//�Խñ� ���� + ÷������ ����
		if(product.deleteProduct(p_number, b_no)) {
			
			//���� ���� ����
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
		log.info("�ءءءء� getAttachList �ءءءء�");
		
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