package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CampusProductVO;
import com.spring.domain.CampusUserVO;
import com.spring.domain.CartListVO;
import com.spring.domain.CartVO;
import com.spring.service.CartService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class CartController {
   
   @Autowired
   private CartService service;

   
   //장바구니 목록
   @PreAuthorize("hasAnyAuthority('ROLE_USER')")
   @RequestMapping("/cart")
   public void list(Model model, String u_userid){
      
  
      
       
      
      log.info("장바구니 목록보여주기");
  	
		List<CartListVO> cartlist = service.listCart(u_userid);
		log.info("테스트 "+cartlist);
		String imgurl="";	
		
		
		 for(CartListVO img:cartlist) {
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
		 model.addAttribute("cartlist",cartlist);    
   }


   
//   //장바구니 담기
   @PreAuthorize("hasAnyAuthority('ROLE_USER')")
   @ResponseBody
   @PostMapping("/cart")
      public boolean addCart(CartVO cart, HttpSession session){
         
         log.info("장바구니 추가" +cart);
         
//         String u_userid =(String)session.getAttribute("u_userid");
         
//         int p_number = 0;
//		//기존 상품이 있는지 검사
//         cart.setP_number(p_number);
//         cart.setU_userid(u_userid);
//         
//         boolean isAlreadyExisted = service.findCartProduct(cart);
//         
//         if(isAlreadyExisted==true) {
//        	 return "already_existed";
//         }else {
//        	 service.addCart(cart);
//        	 return "add_success";
//         }
//         
//         
//         
//         int count = service.countCart(u_userid, cart.getP_number());
////         count == 0 ?service.updateCart(cart) : service.addCart(cart);
//         if(count == 0) {
//        	 service.addCart(cart);
//         }else {
//        	 service.modifyCart(cart);
//         }
//         
//         return "redirect:/update";
        return service.addCart(cart);
   }

    //장바구니 삭제   
   @PreAuthorize("hasAnyAuthority('ROLE_USER')")
   @ResponseBody
   @PostMapping("/delete")
   public boolean delete(@RequestParam(value="cartNum[]") List<Integer> checkArr, HttpSession session) {
      
      log.info("장바구니 삭제" +checkArr);
      
       return  service.delete(checkArr);
   }
   
   
   @PreAuthorize("hasAnyAuthority('ROLE_USER')")
   @ResponseBody
   @PostMapping("/update")
   public boolean modify(CartVO cart, HttpSession session) {
	   
	   log.info("장바구니 수정" +cart);
	   
	   return service.modifyCart(cart);
   }
}



