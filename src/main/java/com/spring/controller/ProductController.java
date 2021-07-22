package com.spring.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
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

	
<<<<<<< HEAD
//	@Autowired
//	private CampusBoardService board;
//	
//	@Autowired
//	private CampusAttachFileDTO attach;
	
=======
	


>>>>>>> refs/remotes/origin/nahyun
	//상품 리스트 전체 나열 + best3까지
	@GetMapping("/productlist")
	public void getList(Model model,CampusCriteria cri) {
		log.info("전체 리스트 조회");
		//전체 리스트, CampusPageVO vo
		
		//상품사진
		
<<<<<<< HEAD
//		String imgurl="";
//		
//		List<CampusAttachFileDTO> dto = service.getImg();
//		for(CampusAttachFileDTO img:dto) {
//			
//			if (dto == null || dto.isEmpty()) {
//				imgurl = "/resources/main/images/default-img.jpg";
//			}else {
//				for(CampusAttachFileDTO ddto:dto) {
//					String path = ddto.getA_path().replace("\\", "%5C");
//					log.info("url 테스트중 : "+path);
//					imgurl = "/display?fileName="+path+"%2F"+ddto.getA_uuid()+"_"+ddto.getA_name();
//					break;
//					}
//				}
//			
//		CampusProductVO pvo=new CampusProductVO();
//		pvo.setUrllink(imgurl);
//		
//		}
=======
		String imgurl="";	
>>>>>>> refs/remotes/origin/nahyun
		List<CampusProductVO> prolist=service.prolist(cri);
		
		for(CampusProductVO img:prolist) {
			if(img.getA_uuid()==null) {
				imgurl="/resources/main/images/default-img.jpg";
			}else {
				String path=img.getA_path().replace("\\", "%5C");
			log.info("url 테스트중 : "+path);
			imgurl = "/display?fileName="+path+"%2F"+img.getA_uuid()+"_"+img.getA_name();
			img.setUrllink(imgurl);
			}
			break;
		}
		
		
		int total = service.total(cri);
		
		//베스트3 사진 
		List<CampusProductVO> bestlist=service.bestlist();
		log.info("best리스트" +bestlist);
		
			for(CampusProductVO img:bestlist) {
					
					if(img.getA_uuid()==null) {
						imgurl="/resources/main/images/default-img.jpg";
					}else {
						String path=img.getA_path().replace("\\", "%5C");
					log.info("url 테스트중 : "+path);
					imgurl = "/display?fileName="+path+"%2F"+img.getA_uuid()+"_"+img.getA_name();
					img.setUrllink(imgurl);
					}
					break;
				}

		
		
		CampusPageVO campusPageVO = new CampusPageVO(cri,total);
		model.addAttribute("CampusPageVO", campusPageVO);
		model.addAttribute("prolist",prolist);
		model.addAttribute("bestlist",bestlist);
	}
	
	
	//카테고리별 조회
	@GetMapping("/catelist")
	public void cateList(CampusCriteria cri,String pc_code,Model model) {
		log.info("카테고리 조회");
		String imgurl="";	
		
		List<CampusProductVO> catelist=service.catelist(cri,pc_code);
		
		for(CampusProductVO img:catelist) {
			if(img.getA_uuid()==null) {
				imgurl="/resources/main/images/default-img.jpg";
			}else {
				String path=img.getA_path().replace("\\", "%5C");
			log.info("url 테스트중 : "+path);
			imgurl = "/display?fileName="+path+"%2F"+img.getA_uuid()+"_"+img.getA_name();
			img.setUrllink(imgurl);
			}
			break;
		}
		
		model.addAttribute("catelist",catelist);
	}//
	
	
	
	//게시판 글번호 읽어서 보는것처럼
	//상품 1개 조회, 보기 => 데이터 읽어온 후 productdetail.jsp
	@GetMapping("/productdetail")
	public void viewproduct(int p_number, @ModelAttribute("cri") CampusCriteria cri,Model model) {
		log.info("상품 상세 넘어가기"+p_number+"cri"+cri);
			
		CampusProductVO product=service.viewProduct(p_number);
			
		model.addAttribute("product", product);
	}
	


}
