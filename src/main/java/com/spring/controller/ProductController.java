package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	//카테고리값넘기기
		
	


	//상품 리스트 전체 나열 + best3까지
	@GetMapping("/productlist")
	public void getList(Model model,CampusCriteria cri) {
		log.info("전체 리스트 조회");
		//전체 리스트, CampusPageVO vo
		
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
		log.info(prolist);
		
		

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
		CampusPageVO campusPageVO = new CampusPageVO(cri,total);
		model.addAttribute("CampusPageVO", campusPageVO);
		log.info("CampusPageVO"+campusPageVO);

		//카테고리값넘기기
		List<CampusProductCategoryVO> category = service.category(cri);
		model.addAttribute("category",category);
	}
	

	
	@GetMapping("/catelist")
	public void catelist(String pc_code,String sort,Model model) {
		log.info("상품 카테고리 넘어가기"+pc_code+" sort "+sort);
		//카테고리코드 리스트를 뽑아서 해당 코드값을 누르면 그게 넘어가서 카테고리별 상품리스트가 나오는거
		//카테고리값넘기기
//		List<CampusProductCategoryVO> category = service.category(cri);
//		model.addAttribute("category",category);
//		log.info("캍텍ㄱ고리"+category);
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
		
//		CampusPageVO campusPageVO = new CampusPageVO(cri,total);
//		model.addAttribute("CampusPageVO", campusPageVO);
		//카테고리코드별 상품리스트 추출
		model.addAttribute("catelist", catelist);
		
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
			
			CampusProductVO vo=service.viewProduct(p_number); // 어태치랑 조인해서 xml하면 vo가 두개넘어감 사진첨부2개하면
			
//			String p_option=vo.getP_option();
//			List<CampusProductOptionVO> option=service.optionlist(p_option);
//			for(CampusProductOptionVO op:option) {
//				op.getPo_option1();
//				op.getPo_option2();
//				op.getPo_option3();
//			}
			//ㄴ리스트배열해서,,?
			
			
			List<CampusAttachFileDTO> attachList = service.getAttachList(p_number);
			
//			List<CampusProductVO> product=service.viewProduct(p_number);
//			String imgurl="";
//			for(CampusProductVO detail:product) {
//				String test = detail.getUrllink();
//
//		            String path=detail.getA_path().replace("\\", "%5C");
//		            log.info("url 테스트중 : "+path);
//		            imgurl = "/display?fileName="+path+"%2F"+detail.getA_uuid()+"_"+detail.getA_name();
//		            detail.setUrllink(imgurl);
//		            
//			}
//			model.addAttribute(cri)
			
//			model.addAttribute("option", option);
//			log.info("옵셔언"+option);
			model.addAttribute("vo", vo);
			log.info("븨이오"+vo);
			model.addAttribute("attach",attachList);
			log.info("어태치"+ attachList);
		}
}
	
	
		
