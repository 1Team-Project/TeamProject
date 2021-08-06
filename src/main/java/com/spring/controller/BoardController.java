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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardCheckOrderVO;
import com.spring.domain.CampusBoardListPageVO;
import com.spring.domain.CampusBoardTopVO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
import com.spring.domain.CampusProductOptionVO;
import com.spring.domain.CampusProductVO;
import com.spring.domain.CampusReplyPageVO;
import com.spring.domain.CampusReplyVO;
import com.spring.domain.CampusUserVO;
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
		log.info("※※※※※ list ※※※※※");  

		//오늘의 화제글
		List<CampusBoardTopVO> toooop = new ArrayList<CampusBoardTopVO>();
		
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
					log.info("url 테스트중 : "+path);
					imgurl = "/display?fileName="+path+"%2F"+ddto.getA_uuid()+"_"+ddto.getA_name();
					break;
				}
			}
			
			//오늘의 화제글 제목/내용이 길면 각각 10/15자 만큼 자르기
			CampusBoardTopVO tovo = new CampusBoardTopVO();
			if (vo.getB_content().length() >= 15) {						
				tovo.setB_content_15(vo.getB_content().substring(0, 14)+"...");					
			}else {
				tovo.setB_content_15(vo.getB_content());											
			}
			if (vo.getB_title().length() >= 10) {
				tovo.setB_title_10(vo.getB_title().substring(0, 9)+"...");						
			}else {
			
				tovo.setB_title_10(vo.getB_title());
			}
			tovo.setB_no(vo.getB_no());
			tovo.setUrllink(imgurl);
			tovo.setRank(rank);
			
			toooop.add(tovo);
		}
		//만약, 오늘 쓴 글이 3개 미만일 경우, 빈 페이지 올리기
		if (rank <= 2) {
			for(int i = 1; i <= 3-rank; i++) {				
				CampusBoardTopVO tovo = new CampusBoardTopVO();
				tovo.setB_title_10("오늘의 화제글!");
				tovo.setB_content_15("오늘의 화제글이 없습니다!");
				tovo.setRank(999);
				tovo.setUrllink("/resources/main/images/default-img.jpg");
				toooop.add(tovo);
			}
		}
		
		
		//전체 리스트 조회 및 모델에 등록
		List<CampusBoardVO> list = service.list(cri);
		int total = service.total(cri);
		model.addAttribute("list", list);
		
		//오늘의 화제글 값 모델에 등록
		model.addAttribute("CampusTopVO", toooop);
		
		//페이지 나누기 값 모델에 등록
		CampusPageVO campusPageVO = new CampusPageVO(cri, total);
		model.addAttribute("CampusPageVO", campusPageVO);
	}
	
	
	@PostMapping("/viewadd")
	@ResponseBody
	public String read2(@RequestBody String bnoval) {
		log.info("※※※※※ view add ※※※※※");  
		
		//bno 를 가져와서, int형으로 캐스팅
		int b_no = Integer.parseInt(bnoval);

		//현재 조회수를 가져옴
		CampusBoardVO campusVO=service.view(b_no);
		
		//+1 한 상태로 입력
		int views = campusVO.getB_views()+1;

		//다시 String 형태로 변환하여 리턴
		String viewsS = Integer.toString(views);
		return viewsS;
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/view")
	public void read(int b_no,int b_views, int r_page,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("※※※※※ view ※※※※※");  
		
		//조회수 가져오기
		CampusBoardVO campusVO=service.view(b_no);
		int views = campusVO.getB_views();
		
		//만약, 조회수가 +1이 아닌 임의로 누군가 바꿨을때도 올라가는 현상 막기
		if (b_views - views == 1 || b_views == 1){			
			service.addview(b_views, b_no);
		}
		
		//댓글 관련
//		List<CampusReplyVO> replyVO = reply.list(r_page, b_no);

//		int countreply = reply.getCountByBno(b_no);
//		CampusReplyPageVO campusReplyPageVO = new CampusReplyPageVO(r_page, countreply);
		
		//모델에 값 등록
		model.addAttribute("campusVO", campusVO);
//		model.addAttribute("replyVO", replyVO);
//		model.addAttribute("campusReplyPageVO", campusReplyPageVO);
		model.addAttribute("r_page",r_page);
		
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void modify(int b_no,@ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("※※※※※ get modify ※※※※※");  
		
		//글 하나에 대한 값 모델에 등록
		CampusBoardVO campusVO=service.view(b_no);
		model.addAttribute("campusVO", campusVO);
	}
	
	@PreAuthorize("principal.username == #vo.b_writer")
	@PostMapping("/modify")
	public String modifyPost(CampusBoardVO vo, CampusCriteria cri, RedirectAttributes rttr) {
		
		log.info("※※※※※ post modify ※※※※※");  

		//첨부 파일 확인
		if(vo.getAttachList()!=null) {
			vo.getAttachList().forEach(attach -> log.info(""+attach));
		}
		
		//글 수정 성공시
		if(service.update(vo)) {
			rttr.addFlashAttribute("result", "성공");
			
			rttr.addAttribute("sort",cri.getSort());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("page",cri.getPage());
			
			return "redirect:list";
		//글 수정 실패시
		}else {
			return "redirect:view?b_no="+vo.getB_no()+"&page="+cri.getPage()+"&keyword="+cri.getKeyword()+"&sort="+cri.getSort();
		}
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public void write() {
		log.info("※※※※※ get write ※※※※※");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/write")
	public String writePost(CampusBoardVO vo, RedirectAttributes rttr) {
		
		log.info("※※※※※ post write ※※※※※");
		log.info("write    "+vo);
		//글 작성 요청 및 성공/실패시
		if(service.insert(vo)) {
			
			// 등록된 p_number 의 p_name 을 추가
			String pfb = service.productfindboard(vo.getP_number());
			vo.setP_name(pfb);
			service.productinsertboard(vo.getB_no(), vo.getP_name());
			
			rttr.addFlashAttribute("result",vo.getB_no());
			return "redirect:list";
		}else {
			return "redirect:register";
		}
		
	}
	@PreAuthorize("principal.username == #b_writer")
	@PostMapping("/remove")
	public String remove(int b_no, String b_writer, CampusCriteria cri, RedirectAttributes rttr) {
		
		log.info("※※※※※ post remove ※※※※※");  
		
		//bno에 해당되는 첨부파일 목록 알아내기
		List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
		
		//성공시 게시글 삭제 + 첨부파일 삭제
		if(service.delete(b_no)) {

			//폴더 파일 삭제
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "성공");
			
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("page",cri.getPage());
			rttr.addAttribute("sort",cri.getSort());
			
			return "redirect:list";
		}else {
			return "redirect:modify?b_no="+b_no+"&page="+cri.getPage()+"&keyword="+cri.getKeyword()+"&sort="+cri.getSort();
		}
	}
		
		@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
		@PostMapping("/removeAdmin")
		public String removeAdmin(int b_no, String b_writer, CampusCriteria cri, RedirectAttributes rttr) {
			
			log.info("※※※※※ post remove ※※※※※");  
			
			//bno에 해당되는 첨부파일 목록 알아내기
			List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
			
			//성공시 게시글 삭제 + 첨부파일 삭제
			if(service.delete(b_no)) {

				//폴더 파일 삭제
				deleteFiles(attachList);
				
				rttr.addFlashAttribute("result", "성공");
				
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
	@ResponseBody
	public String replyadd(CampusReplyVO vo) {
		
		log.info("※※※※※ post replyadd ※※※※※");  

		log.info("댓글 추가 테스트 : "+vo);
		
		//댓글 등록 성공시
		if(reply.insert(vo)) {
			
			int replycnt = reply.getCountByBno(vo.getB_no());
			
			if(service.replyadd(vo.getB_no(), replycnt)) {
				return "OK";
			}else {
				return "NO";				
			}
		}
		return "NO";
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/replymodify")
	@ResponseBody
	public String replymodify(CampusReplyVO vo) {
		
		log.info("※※※※※ post replymodify ※※※※※");  
		
		//댓글 수정 요청
		if(reply.update(vo)) {
			return "OK";
		}
		return "NO";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/replyremove")
	@ResponseBody
	public String replyremove(CampusReplyVO vo) {
		
		log.info("※※※※※ post replyremove ※※※※※");  
		
		//댓글 삭제 요청
		if(reply.delete(vo.getR_no())) {
			return "OK";
		}
		return "NO";
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@GetMapping("/sellwrite")
	public void sellwrite() {
		log.info("※※※※※ get sellwrite ※※※※※");
	}
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@PostMapping("/sellwrite")
	public String sellwritePost(
	         
			@RequestParam("p_numbers") int p_numbers,
			
	         @RequestParam("p_name") String p_name, 
	         @RequestParam("p_price") int p_price, 
	         @RequestParam("pc_code") String pc_code, 
	         @RequestParam("p_stock") int p_stock, 
	         @RequestParam("p_manufact") String p_manufact,
	         
	         @RequestParam("po_optiontitle") String po_optiontitle,
	         @RequestParam("po_option1") String po_option1,
	         @RequestParam("po_option2") String po_option2,
	         @RequestParam("po_option3") String po_option3,
	         	         
	         CampusBoardVO vob,
	         
	         RedirectAttributes rttr) {
	      
	      CampusProductVO vo = new CampusProductVO();
	      vo.setP_name(p_name);
	      vo.setP_number(p_numbers);
	      vo.setP_price(p_price);
	      vo.setPc_code(pc_code);
	      vo.setP_stock(p_stock);
	      vo.setP_manufact(p_manufact);
	      
	      vob.setP_number(p_numbers);

	      log.info("※※※※※ post sellwrite ※※※※※");
		
		//po_optiontitle 에 값이 들어왔을때 (productoption 테이블의 optiontitle)
		//product 의 option에는 값이 안들어오기 때문에, 강제로 값을 집어넣어줌.
		if (po_optiontitle != null && !po_optiontitle.isEmpty()) {
			vo.setP_option(po_optiontitle);
		//보험처리 (이상하게 적었을 경우)
		}else if(po_option1 != null || po_option2 != null || po_option3 != null){
			po_option1 = "-----";
			po_option2 = "-----";
			po_option3 = "-----";
		}
		if (po_optiontitle == null || po_optiontitle.isEmpty()) {
			vo.setP_option("-----");
			po_optiontitle = "-----";
		}
		//보험처리 (null 못받아올 경우 대비)
		if (po_option1 == null || po_option1 == "") {
			po_option1 = "-----";
		}
		if (po_option2 == null || po_option2 == "") {
			po_option2 = "-----";
		}
		if (po_option3 == null || po_option3 == "") {
			po_option3 = "-----";
		}
		
	      CampusProductOptionVO voo = new CampusProductOptionVO();
	      voo.setP_number(p_numbers);	      
	      voo.setPo_optiontitle(po_optiontitle);
	      voo.setPo_option1(po_option1);
	      voo.setPo_option2(po_option2);
	      voo.setPo_option3(po_option3);
		
		//값들이 정상적으로 들어왔나 확인용
		log.info("productVO 테스트 : "+vo);
		log.info("productVO (option) 테스트 : "+voo);
		log.info("productVO (board) 테스트 : "+vob);
		
		//board => b_no, b_content 넣기
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
	@GetMapping("/gosellmodify")
	public void gosellmodify() {
		log.info("※※※※※ gosellmodify ※※※※※");
	}	
	
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@GetMapping("/sellmodify")
	public void sellmodify(int p_number, Model model) {
		log.info("※※※※※ get sellmodify ※※※※※");
		
		//상품 정보, 게시글(상품) 정보 가져오기
		CampusProductVO campusProductVO = product.viewProduct(p_number);
		//CampusBoardVO campusBoardVO = service.view(b_no);
		//model.addAttribute("campusBoardVO", campusBoardVO);
		model.addAttribute("campusProductVO", campusProductVO);
	}
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@PostMapping("/sellmodify")
	public String sellmodifyPost(CampusProductVO vo) {
		log.info("※※※※※ post sellmodify ※※※※※");

		//수정하기
		if(product.updateProduct(vo.getP_price(), vo.getP_stock(), vo.getP_number())) {
			return "redirect:list";
		}else {
			return "redirect:index";
		}
	}
	@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
	@PostMapping("/sellremove")
	public String sellremove(int b_no, int p_number, RedirectAttributes rttr) {
		log.info("※※※※※ post sellremove ※※※※※");
		
		//bno에 해당되는 첨부파일 목록 알아내기
		List<CampusAttachFileDTO> attachList = service.getAttachList(b_no);
		
		//게시글 삭제 + 첨부파일 삭제
		if(product.deleteProduct(p_number, b_no)) {
			
			//폴더 파일 삭제
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "성공");

			return "redirect:list";
		}else {
			return "redirect:index";
		}
		
		
	}
	
	
	@GetMapping("/pages/{b_no}/{r_page}")
	public ResponseEntity<CampusReplyPageVO> getList(@PathVariable("b_no")int b_no,@PathVariable("r_page")int r_page){
		log.info("댓글 가져오기 "+b_no+" page "+r_page);
		
		int total = reply.getCountByBno(b_no);
		List<CampusReplyVO> list = reply.list(r_page, b_no);
		
		CampusReplyPageVO vo = new CampusReplyPageVO(total,list);
		
		return new ResponseEntity<CampusReplyPageVO>(vo,HttpStatus.OK);
	
	}

	
	@GetMapping("/lists/{psort}/{ppage}/{pkeyword}/{ptest}")
	public ResponseEntity<CampusBoardListPageVO> getLists(@PathVariable("psort")String sort,@PathVariable("ppage")int page,@PathVariable("pkeyword")String keyword,@PathVariable("ptest")String test){
		log.info("게시판 에이작스");
		
		if (test.equals("후기")){
			
			CampusCriteria cri = new CampusCriteria();
			cri.setPage(page);
			if(keyword.equals("-") || sort.equals("-")) {
				cri.setSort("");
				cri.setKeyword("");
			}else {				
				cri.setSort(sort);
				cri.setKeyword(keyword);
			}
			
			int total = service.totalReview(cri);
			List<CampusBoardVO> list = service.listReview(cri);
			
			CampusBoardListPageVO vo = new CampusBoardListPageVO(total,list);
			
			return new ResponseEntity<CampusBoardListPageVO>(vo,HttpStatus.OK);
			
		}else if(test.equals("질문")){
			
			CampusCriteria cri = new CampusCriteria();
			cri.setPage(page);
			if(keyword.equals("-") || sort.equals("-")) {
				cri.setSort("");
				cri.setKeyword("");
			}else {				
				cri.setSort(sort);
				cri.setKeyword(keyword);
			}
			
			int total = service.totalQNA(cri);
			List<CampusBoardVO> list = service.listQNA(cri);
			
			CampusBoardListPageVO vo = new CampusBoardListPageVO(total,list);
			
			return new ResponseEntity<CampusBoardListPageVO>(vo,HttpStatus.OK);
			
		}
	
		return new ResponseEntity<CampusBoardListPageVO>(HttpStatus.BAD_REQUEST);
		
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/checkpnumber", produces="application/text;charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String checkpnumber(int p_number) {
		
		log.info("※※※※※ post checkpnumber ※※※※※");  
		
		CampusProductVO vo = product.viewProduct(p_number);
		
		String proName = "not";
		log.info("체크넘버 : "+vo);
		if(vo!=null) {
			proName = vo.getP_name();
		}
		log.info("체크넘버스트링 : "+proName);
		
		return proName;
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/checkpnumberOrder", produces="application/text;charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String checkpnumberOrder(int p_number, String u_userid) {
		
		log.info("※※※※※ post checkpnumber ※※※※※");  
		
		CampusProductVO vo = product.viewProduct(p_number);
		
		String proName = "not";
		
		log.info("체크넘버 : "+vo);
		if(vo!=null) {
			proName = vo.getP_name();
		}
		log.info("체크넘버스트링 : "+proName);
		
		String isOk = "no";
		
		List<CampusBoardCheckOrderVO> list = service.orderCheck(u_userid);
		
		for(CampusBoardCheckOrderVO is:list) {
			int check = is.getP_number();
			
			if(vo!=null) {				
				if(check == vo.getP_number()) {
					isOk = "yes";
				}
			}
		}
		
		if(!isOk.equals("yes") && !proName.equals("not")) {
			proName = "nnot";
			return proName;
		}
		log.info("마지막 테스트 : "+proName);
		return proName;
	}
	
	//첨부물 가져오기
	@GetMapping("/getAttachList")
	public ResponseEntity<List<CampusAttachFileDTO>> getAttachList(int b_no){
		log.info("※※※※※ getAttachList ※※※※※");
		
		return new ResponseEntity<List<CampusAttachFileDTO>>(service.getAttachList(b_no),HttpStatus.OK);
	}
	
	private void deleteFiles(List<CampusAttachFileDTO> attachList) {
		log.info("첨부파일 삭제 요청 "+attachList);
		
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
