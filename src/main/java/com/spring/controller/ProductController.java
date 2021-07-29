package com.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
import com.spring.domain.CampusProductCategoryVO;
import com.spring.domain.CampusProductOptionVO;
import com.spring.domain.CampusProductPageVO;
import com.spring.domain.CampusProductVO;
import com.spring.service.CampusBoardService;
import com.spring.service.CampusProductService;


import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Autowired
	private CampusProductService service;
	
	@Autowired
	private CampusBoardService board;

	//상품 리스트 전체 나열 + best3까지
	@GetMapping("/productlist")
	public void getList(Model model,String sort) {
		log.info("전체 리스트 조회");
		//전체 리스트, CampusPageVO vo
		CampusCriteria cri=new CampusCriteria();
		cri.setPage(1);
		cri.setSort(sort);
		//상품사진
		
		String imgurl="";	
		List<CampusProductVO> prolist=service.prolist(cri);
		
		 for(CampusProductVO img:prolist) {
	         String test = img.getUrllink();

	         if(test == null || test.isEmpty()) {
	            String path=img.getA_path().replace("\\", "%5C");
	            log.info("url 테스트중 : "+path);
	            imgurl = "/display?fileName="+path+"%2F"+img.getA_uuid()+"_"+img.getA_name();
	            img.setUrllink(imgurl);
	         }else {
	            imgurl="/resources/main/images/default-img.jpg";
	            img.setUrllink(imgurl);
	         }
	      }
		log.info(prolist+"리스트확인");
		
		

		model.addAttribute("prolist",prolist);

		//베스트3 사진 
		List<CampusProductVO> bestlist=service.bestlist();
		log.info("best리스트" +bestlist);
		

		 for(CampusProductVO img:bestlist) {
	         String test = img.getUrllink();

	         if(test == null || test.isEmpty()) {
	            String path=img.getA_path().replace("\\", "%5C");
	            log.info("url 테스트중 : "+path);
	            imgurl = "/display?fileName="+path+"%2F"+img.getA_uuid()+"_"+img.getA_name();
	            img.setUrllink(imgurl);
	         }else {
	            imgurl="/resources/main/images/default-img.jpg";
	            img.setUrllink(imgurl);
	         }
	      }
		
		
		model.addAttribute("bestlist",bestlist);
		
		
		//페이지 나누기 값 모델에 등록 
		int total = service.total(cri);
		CampusProductPageVO productPageVO = new CampusProductPageVO(cri,total);
		model.addAttribute("CampusProductPageVO", productPageVO);
		log.info("CampusProductPageVO"+productPageVO);

		//카테고리값넘기기
		List<CampusProductCategoryVO> category = service.category(cri);
		model.addAttribute("category",category);
	}

	
@GetMapping("/catelist")
public void catelist(String pc_code,String sort,Model model) {
	log.info("상품 카테고리 넘어가기"+pc_code+" sort "+sort);
	//카테고리코드 리스트를 뽑아서 해당 코드값을 누르면 그게 넘어가서 카테고리별 상품리스트가 나오는거
	//카테고리값넘기기
//	List<CampusProductCategoryVO> category = service.category(cri);
//	model.addAttribute("category",category);
//	log.info("캍텍ㄱ고리"+category);
	String imgurl="";
	CampusCriteria cri=new CampusCriteria();
	cri.setPage(1);
	cri.setSort(sort);
	
	List<CampusProductVO> catelist=service.catelist(cri, pc_code);
	 for(CampusProductVO img:catelist) {
         String test = img.getUrllink();

         if(test == null || test.isEmpty()) {
            String path=img.getA_path().replace("\\", "%5C");
            log.info("url 테스트중 : "+path);
            imgurl = "/display?fileName="+path+"%2F"+img.getA_uuid()+"_"+img.getA_name();
            img.setUrllink(imgurl);
         }else {
            imgurl="/resources/main/images/default-img.jpg";
            img.setUrllink(imgurl);
         }
      }
	log.info(catelist);
	
	//int total = service.total(cri);
	
//	CampusPageVO campusPageVO = new CampusPageVO(cri,total);
//	model.addAttribute("CampusPageVO", campusPageVO);
	//카테고리코드별 상품리스트 추출
	model.addAttribute("catelist", catelist);
	model.addAttribute("cri", cri);
	
	//헤더부분 - 카테고리값넘기기
	List<CampusProductCategoryVO> category = service.category(cri);
	model.addAttribute("category",category);
	
	log.info("카테고리별 상품리스트"+catelist);
}



	
	
		//게시판 글번호 읽어서 보는것처럼
		//상품 1개 조회, 보기 => 데이터 읽어온 후 productdetail.jsp
		@GetMapping("/productdetail")
		public void viewproduct(int p_number, @ModelAttribute("cri") CampusCriteria cri,Model model) {
			log.info("상품 상세 넘어가기"+p_number+"cri"+cri);
			//상단의 상품 정보만 가져옴
			CampusProductVO vo=service.viewProduct(p_number); // 어태치랑 조인해서 xml하면 vo가 두개넘어감 사진첨부2개하면
			//이미지 1개 링크
			String url="";
		         if(vo.getUrllink() == null ||(vo.getUrllink().isEmpty())) {
		            String path=vo.getA_path().replace("\\", "%5C");
		            log.info("url 테스트중 : "+path);
		            url = "/display?fileName="+path+"%2F"+vo.getA_uuid()+"_"+vo.getA_name();
		            vo.setUrllink(url);
		         }else {
			            url="/resources/main/images/default-img.jpg";
			            vo.setUrllink(url);
			         }
			//상품상세 중간의 사진 등 가져옴
			CampusBoardVO con=service.viewProductcontent(p_number);
			
			//경로 설정
			for(CampusAttachFileDTO dto:con.getAttachList()) {
				log.info(dto.getA_path());
				dto.setA_path(dto.getA_path().replaceAll("\\\\", "\\\\\\\\"));
			}
			
			
			
			//List<CampusAttachFileDTO> attachList = service.getAttachList(p_number);

			//상품 후기(+별점)와 질문
			List<CampusBoardVO> review=service.selectReview(p_number);
			List<CampusBoardVO> question=service.selectq(p_number);

			log.info("뤼스트 :"+con);

			
			model.addAttribute("vo", vo);
			
			log.info("븨이오"+vo);

			model.addAttribute("con",con);
			log.info("내용"+con);
			model.addAttribute("review",review);
			model.addAttribute("question",question);
			
		}
		
		@GetMapping("/getAttachList")
		public ResponseEntity<List<CampusAttachFileDTO>> getAttachList(int p_number){
			log.info("※※※※※ getAttachList ※※※※※");
			
			return new ResponseEntity<List<CampusAttachFileDTO>>(service.getAttachList(p_number),HttpStatus.OK);
		}

}
	
	
		
