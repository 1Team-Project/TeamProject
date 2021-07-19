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
public class BoradController {
	

	@Autowired
	private CampusBoardService service;

	@Autowired
	private CampusReplyService reply;
	
	@Autowired
	private CampusProductService product;

	@GetMapping("/list")
	public void list(Model model, CampusCriteria cri) {
		
<<<<<<< HEAD
		log.info("Ï†ÑÏ≤¥ Î¶¨Ïä§Ìä∏ Ï°∞Ìöå");
=======
		log.info("¿¸√º ∏ÆΩ∫∆Æ ¡∂»∏");
		//∏ÆΩ∫∆Æ ¡∂»∏
>>>>>>> refs/remotes/origin/hanjung
		List<CampusBoardVO> list = service.list(cri);
		int total = service.total(cri);

		//list ¿Ã∏ß¿∏∑Œ ¡∂»∏µ» ¿⁄∑· ∏µ®ø° µÓ∑œ (∏ÆΩ∫∆Æ ª—∑¡¡÷±‚)
		model.addAttribute("list", list);

		List<CampusBoardTopVO> top = new ArrayList<CampusBoardTopVO>();
		
		//ø¿¥√¿« »≠¡¶±€

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
					log.info("url ≈◊Ω∫∆Æ¡ﬂ : "+path);
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

			log.info("≈◊Ω∫∆Æ »Æ¿Œ ≈◊Ω∫∆Æ »Æ¿Œ : "+top);
		}
		if (rank <= 2) {
			for(int i = 1; i <= 3-rank; i++) {				
				CampusBoardTopVO tovo = new CampusBoardTopVO();
				tovo.setB_title_10("ø¿¥√¿« »≠¡¶±€!");
				tovo.setB_content_15("ø¿¥√¿« »≠¡¶±€¿Ã æ¯Ω¿¥œ¥Ÿ!");
				tovo.setRank(999);
				tovo.setUrllink("/resources/main/images/default-img.jpg");
				top.add(tovo);
			}
		}
		
		//ø¿¥√¿« »≠¡¶±€
		model.addAttribute("CampusTopVO", top);
		
		//∆‰¿Ã¡ˆ ≥™¥©±‚
		CampusPageVO campusPageVO = new CampusPageVO(cri, total);
		
		//∆‰¿Ã¡ˆ ≥™¥©±‚ ∞¸∑√
		model.addAttribute("CampusPageVO", campusPageVO);
	}
	

	@PostMapping("/viewadd")
	@ResponseBody
	public String read2(@RequestBody String bnoval) {
		
		log.info("Î∑∞ Ïï†Îìú ÌÖåÏä§Ìä∏");
		log.info(bnoval);
		int b_no = Integer.parseInt(bnoval);
<<<<<<< HEAD
		log.info("int Ï≤òÎ¶¨Îêú bno"+b_no);
=======
		log.info("int √≥∏Æµ» bno"+b_no);
		//«ˆ¿Á ¡∂»∏ºˆ∏¶ ∞°¡Æø»
>>>>>>> refs/remotes/origin/hanjung
		CampusBoardVO campusVO=service.view(b_no);
		//+1 «— ªÛ≈¬∑Œ ¿‘∑¬
		int views = campusVO.getB_views()+1;
		log.info("views Í∞í : "+views);
		String viewsS = Integer.toString(views);

		return viewsS;
	}
	
	@GetMapping("/view")
<<<<<<< HEAD
	public void read(int b_no,int b_views,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("Í∏Ä ÌïòÎÇò Í∞ÄÏ†∏Ïò§Í∏∞ "+b_no+" cri : "+cri);  
=======
	public void read(int b_no,int b_views, int r_page,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("±€ «œ≥™ ∞°¡Æø¿±‚ "+b_no+" cri : "+cri);  
>>>>>>> refs/remotes/origin/hanjung
		
		CampusBoardVO campusVO=service.view(b_no);
		int views = campusVO.getB_views();
		
		//∏∏æ‡, ¡∂»∏ºˆ∞° +1¿Ã æ∆¥— ¿”¿«∑Œ ¥©±∫∞° πŸ≤Â¿ª∂ß, ∏∑±‚
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
		log.info("Í∏Ä ÏàòÏ†ï "+b_no+" cri : "+cri);  
		
		CampusBoardVO campusVO=service.view(b_no);
		model.addAttribute("campusVO", campusVO);
	}
	
	@PostMapping("/modify")
	public String modifyPost(CampusBoardVO vo, CampusCriteria cri, RedirectAttributes rttr) {
		
		log.info("±€ ºˆ¡§"+cri);

		//√∑∫Œ ∆ƒ¿œ »Æ¿Œ
		if(vo.getAttachList()!=null) {
			vo.getAttachList().forEach(attach -> log.info(""+attach));
		}
		
		if(service.update(vo)) {
			rttr.addFlashAttribute("result", "º∫∞¯");
			
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
		log.info("ÏÉàÍ∏Ä Îì±Î°ù Ìèº ÏöîÏ≤≠");
	}
	
	@PostMapping("/write")
	public String registerPost(CampusBoardVO vo, RedirectAttributes rttr) {
		
		log.info("Í∏Ä ÏûëÏÑ±  "+vo);
		
		if(service.insert(vo)) {
			log.info("Í∏Ä ÏûëÏÑ± ÏöîÏ≤≠ : "+vo.getB_no()+" /// "+vo.getAttachList());
			rttr.addFlashAttribute("result",vo.getB_no());
			return "redirect:list";
		}else {
			return "redirect:register";
		}
		
	}

	@PostMapping("/remove")
	public String remove(int b_no, String writer, CampusCriteria cri, RedirectAttributes rttr) {
		
		log.info("ªË¡¶ ø‰√ª   "+b_no);
		
		//º≠πˆø° ¿˙¿Âµ» √∑∫Œ∆ƒ¿œ ªË¡¶
		//1. bnoø° «ÿ¥Áµ«¥¬ √∑∫Œ∆ƒ¿œ ∏Ò∑œ æÀæ∆≥ª±‚
		List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
		
		//∞‘Ω√±€ ªË¡¶ + √∑∫Œ∆ƒ¿œ ªË¡¶
		if(service.delete(b_no)) {

			//2. ∆˙¥ı ∆ƒ¿œ ªË¡¶
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "º∫∞¯");
			
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
		
		log.info("¥Ò±€ ¿€º∫  "+vo);
		
		if(reply.insert(vo)) {
			log.info("¥Ò±€ ¿€º∫ ø‰√ª : "+vo.getB_no());
			
			int replycnt = reply.getCountByBno(b_no);
			
			service.replyadd(b_no, replycnt);
	
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&r_page=1&b_views="+b_views+"&b_no="+b_no;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&r_page=1&b_views="+b_views+"&b_no="+b_no;
		}
		
	}
	
	@PostMapping("/replymodify")
	public String replymodify(int b_no, int b_views, int r_page, CampusReplyVO vo, CampusCriteria cri) {
		
		log.info("¥Ò±€ ºˆ¡§ "+vo);
		
		if(reply.update(vo)) {
			log.info("¥Ò±€ ºˆ¡§ ø‰√ª : "+vo.getB_no());

			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}
		
	}
	
	
	@PostMapping("/replyremove")
	public String replyremove(int b_no, int b_views, int r_page, CampusReplyVO vo, CampusCriteria cri) {
		
		log.info("¥Ò±€ ªË¡¶ "+vo);
		
		if(reply.delete(vo.getR_no())) {
			log.info("¥Ò±€ ªË¡¶ ø‰√ª : "+vo.getB_no()+" / "+vo.getR_no());
			
			int replycnt = reply.getCountByBno(b_no);
			
			service.replyadd(b_no, replycnt);

			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}else {
			return "redirect:view?sort="+cri.getSort()+"&keyword="+cri.getKeyword()+"&page="+cri.getPage()+"&b_views="+b_views+"&b_no="+b_no+"&r_page="+r_page;
		}
		
	}
	
	
	@GetMapping("/sellwrite")
	public void sellwrite() {
<<<<<<< HEAD
		log.info("ÌåêÎß§ Îì±Î°ù Ïù¥Îèô Ïã§Ìñâ");
=======
		log.info("∆«∏≈ ¿Ãµø");
>>>>>>> refs/remotes/origin/hanjung
	}
	
<<<<<<< HEAD
	@GetMapping("/sellmodify")
	public void sellmodify() {
		log.info("ÌåêÎß§ ÏàòÏ†ï Ïù¥Îèô Ïã§Ìñâ");
=======
	@PostMapping("/sellwrite")
	public String sellwritePost(CampusProductVO vo, CampusProductOptionVO voo, CampusBoardVO vob,RedirectAttributes rttr) {
		log.info("∆«∏≈ µÓ∑œ ø‰√ª");
		
		//po_optiontitle ø° ∞™¿Ã µÈæÓø‘¿ª∂ß (productoption ≈◊¿Ã∫Ì¿« optiontitle)
		//product ¿« optionø°¥¬ ∞™¿Ã æ»µÈæÓø¿±‚ ∂ßπÆø°, ∞≠¡¶∑Œ ∞™¿ª ¡˝æÓ≥÷æÓ¡‹.
		if (voo.getPo_optiontitle() != null && voo.getPo_optiontitle() != "") {
			vo.setP_option(voo.getPo_optiontitle());
		//∫∏«Ë√≥∏Æ (¿ÃªÛ«œ∞‘ ¿˚æ˙¿ª ∞ÊøÏ)
		}else if(voo.getPo_option1() != null || voo.getPo_option2() != null || voo.getPo_option3() != null){
			voo.setPo_option1("-");
			voo.setPo_option2("-");
			voo.setPo_option3("-");
		}
		if (voo.getPo_optiontitle() == null || voo.getPo_optiontitle() == "") {
			vo.setP_option("-");
			voo.setPo_optiontitle("-");
		}
		//∫∏«Ë√≥∏Æ (null ∏¯πﬁæ∆ø√ ∞ÊøÏ ¥Î∫Ò)
		if (voo.getPo_option1() == null && voo.getPo_option1() == "") {
			voo.setPo_option1("-");
		}
		if (voo.getPo_option2() == null && voo.getPo_option2() == "") {
			voo.setPo_option2("-");
		}
		if (voo.getPo_option3() == null && voo.getPo_option3() == "") {
			voo.setPo_option3("-");
		}
		
		//∞™µÈ¿Ã ¡§ªÛ¿˚¿∏∑Œ µÈæÓø‘≥™ »Æ¿ŒøÎ
		log.info("productVO ≈◊Ω∫∆Æ : "+vo);
		log.info("productVO (option) ≈◊Ω∫∆Æ : "+voo);
		log.info("productVO (board) ≈◊Ω∫∆Æ : "+vob);
		
		//board => b_no, b_content ≥÷±‚
		//option => p_number, po_optiontitle, po_option1,2,3
		//category => pc_code, pc_name
		//product => p_name, p_price, p_option, p_stock, pc_code
		
		if(product.insertProduct(vo, voo, vob)) {
			rttr.addFlashAttribute("result",vob.getB_no());
			return "redirect:list";
		}else {
			return "redirect:list";
		}

>>>>>>> refs/remotes/origin/hanjung
	}

	@GetMapping("/sellmodify")
	public void sellmodify(int p_number, int b_no, Model model) {
		log.info("ªÛ«∞ ºˆ¡§ "+p_number);  
		
		CampusProductVO campusProductVO = product.viewProduct(p_number);
		CampusBoardVO campusBoardVO = service.view(b_no);
		model.addAttribute("campusBoardVO", campusBoardVO);
		model.addAttribute("campusProductVO", campusProductVO);
	}
	
	@PostMapping("/sellmodify")
	public String sellmodifyPost(CampusProductVO vo) {
		
		log.info("ªÛ«∞ ºˆ¡§");

		if(product.updateProduct(vo.getP_price(), vo.getP_stock(), vo.getP_number())) {
			return "redirect:list";
		}else {
			return "redirect:index";
		}
	}
	
	@PostMapping("/sellremove")
	public String sellremove(int b_no, int p_number, RedirectAttributes rttr) {
		
		log.info("ªÛ«∞ ªË¡¶ ø‰√ª   "+b_no);
		
		//º≠πˆø° ¿˙¿Âµ» √∑∫Œ∆ƒ¿œ ªË¡¶
		//1. bnoø° «ÿ¥Áµ«¥¬ √∑∫Œ∆ƒ¿œ ∏Ò∑œ æÀæ∆≥ª±‚
		List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
		
		//∞‘Ω√±€ ªË¡¶ + √∑∫Œ∆ƒ¿œ ªË¡¶
		if(product.deleteProduct(p_number, b_no)) {
			
			//2. ∆˙¥ı ∆ƒ¿œ ªË¡¶
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "º∫∞¯");

			return "redirect:list";
		}else {
			return "redirect:index";
		}
		
		
	}
	
	
	//√∑∫Œπ∞ ∞°¡Æø¿±‚
	@GetMapping("/getAttachList")
	public ResponseEntity<List<CampusAttachFileDTO>> getAttachList(int b_no){
		log.info("√∑∫Œπ∞ ∞°¡Æø¿±‚ "+b_no);
		
		return new ResponseEntity<List<CampusAttachFileDTO>>(service.getAttachList(b_no),HttpStatus.OK);
	}
	
	private void deleteFiles(List<CampusAttachFileDTO> attachList) {
		log.info("√∑∫Œ∆ƒ¿œ ªË¡¶ ø‰√ª "+attachList);
		
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
