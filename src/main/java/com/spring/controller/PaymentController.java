package com.spring.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusOrderVO;
import com.spring.domain.CartDummyVO;
import com.spring.domain.CartPaymentVO;
import com.spring.domain.CartVO;
import com.spring.mapper.CampusBoardAttachMapper;
import com.spring.mapper.CampusBoardMapper;
import com.spring.mapper.CartMapper;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/payment/*")
public class PaymentController {

	
	@Autowired
	private CartMapper cart;
	
	@Autowired
	private CampusBoardAttachMapper attach;
	
//	@PreAuthorize("isAuthenticated()")
//	@GetMapping("/paymentpage")
//	public void list(Model model) {
//		log.info("※※※※※ get payment page ※※※※※"); 
//		
//		List<CartVO> list = cart.listCart("user11");
//		
//		int total_pay = 0;
//		int total_parcel = 0;
//		
//		for(CartVO vo:list) {
//			
//			String imgurl = "";
//			
//			if(attach.findByPnumber(vo.getP_number()).isEmpty() || attach.findByPnumber(vo.getP_number()) == null) {
//				imgurl = "/resources/main/images/default-img.jpg";
//			}else {
//				List<CampusAttachFileDTO> check = attach.findByPnumber(vo.getP_number());
//				String path = "";
//				for(CampusAttachFileDTO topath:check) {
//					path = topath.getA_path().replace("\\", "%5C");
//					imgurl = "/display?fileName="+path+"%2F"+topath.getA_uuid()+"_"+topath.getA_name();
//					break;
//				}
//			}
//			total_pay += vo.getMoney();
//			total_pay += vo.getP_shippingfee();
//			total_parcel += vo.getP_shippingfee();
//			vo.setCartimg(imgurl);
//		}
//		
//		model.addAttribute("campusCartVO",list);
//		model.addAttribute("total_pay",total_pay);
//		model.addAttribute("total_parcel",total_parcel);
//		
//	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/paymentpage")
	public void list(Model model) {
		log.info("※※※※※ get payment page ※※※※※"); 
		
		//아이디 넘겨와서 집어넣기
		List<CartPaymentVO> list = cart.listPayment("user11");
		
		int total_pay = 0;
		int total_parcel = 0;
		
		for(CartPaymentVO vo:list) {
			
			String imgurl = "";
			
			if(attach.findByPnumber(vo.getP_number()).isEmpty() || attach.findByPnumber(vo.getP_number()) == null) {
				imgurl = "/resources/main/images/default-img.jpg";
			}else {
				List<CampusAttachFileDTO> check = attach.findByPnumber(vo.getP_number());
				String path = "";
				for(CampusAttachFileDTO topath:check) {
					path = topath.getA_path().replace("\\", "%5C");
					imgurl = "/display?fileName="+path+"%2F"+topath.getA_uuid()+"_"+topath.getA_name();
					break;
				}
			}
			vo.setMoney((vo.getP_price())*(vo.getC_count()));
			
			total_pay += vo.getMoney();
			total_pay += vo.getP_shippingfee();
			total_parcel += vo.getP_shippingfee();
			vo.setCartimg(imgurl);
		}
		
		model.addAttribute("campusCartVO",list);
		model.addAttribute("total_pay",total_pay);
		model.addAttribute("total_parcel",total_parcel);
		
	}
	
	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {
		log.info("※※※※※ get kakao page ※※※※※");  
	}
	
	@PostMapping("/formtest")
	public String kakaoPayPost(CartDummyVO cartVO ,CampusOrderVO voo, String total_pay, Model model) {
		
		log.info("teetetstsetsete+++ ",cartVO);
		
		List<CartVO> list = new ArrayList<CartVO>();
		
		int count = 0;
		
		String name="";
		
		
		for(CartDummyVO check : cartVO.getCartVO()) {
			
			CartPaymentVO vo = new CartPaymentVO();
			int pnum = Integer.parseInt(check.getP_number());
			int pmon = Integer.parseInt(check.getMoney());
			int ccou = Integer.parseInt(check.getC_count());
			int pric = Integer.parseInt(check.getP_price());
			vo.setP_number(pnum);
			vo.setP_name(check.getP_name());
			vo.setMoney(pmon);
			vo.setP_price(pric);
			vo.setC_count(ccou);
			vo.setPo_option_vo(check.getPo_option_vo());
			
			count ++;
			
			if (count == 1) {
				name = vo.getP_name();
			}
			
		}
		
		if (count > 1) {
			name = name+"외 "+(count-1)+"종";
		}
		
		//전체 이름
		model.addAttribute("total_name",name);
		//전체 금액
		model.addAttribute("total_pay",total_pay);
		//카운트 횟수
		model.addAttribute("total_count",count);
		
		model.addAttribute("list",list);
		
		
		return "/payment/kakaoPay";
	}
	
	
//	@GetMapping("/kakaoPay")
//	public void kakaoPayGet() {
//		log.info("※※※※※ get kakao page ※※※※※");  
//	}
//	
//	@PostMapping("/formtest")
//	public String kakaoPayPost(CartDummyVO cartVO ,CampusOrderVO voo, String total_pay, Model model) {
//		
//		log.info("teetetstsetsete+++ ",cartVO);
//		
//		List<CartVO> list = new ArrayList<CartVO>();
//		
//		int count = 0;
//		
//		String name="";
//		
//		
//		for(CartDummyVO check : cartVO.getCartVO()) {
//			
//			CartVO vo = new CartVO();
//			int pnum = Integer.parseInt(check.getP_number());
//			int pmon = Integer.parseInt(check.getMoney());
//			int ccou = Integer.parseInt(check.getC_count());
//			int pric = Integer.parseInt(check.getPrice());
//			vo.setP_number(pnum);
//			vo.setP_name(check.getP_name());
//			vo.setMoney(pmon);
//			vo.setPrice(pric);
//			vo.setC_count(ccou);
//			vo.setPo_option_vo(check.getPo_option_vo());
//			
//			count ++;
//			
//			if (count == 1) {
//				name = vo.getP_name();
//			}
//			
//		}
//		
//		if (count > 1) {
//			name = name+"외 "+(count-1)+"종";
//		}
//		
//		//전체 이름
//		model.addAttribute("total_name",name);
//		//전체 금액
//		model.addAttribute("total_pay",total_pay);
//		//카운트 횟수
//		model.addAttribute("total_count",count);
//		
//		model.addAttribute("list",list);
//		
//		
//		return "/payment/kakaoPay";
//	}
//	
//	
//	@RequestMapping("/kakaopay.cls")
//	@ResponseBody
//	public String kakaopay() {
//		
//		try {
//			URL addr = new URL("https://kapi.kakao.com/v1/payment/ready");
//			HttpURLConnection connect = (HttpURLConnection) addr.openConnection();
//			connect.setRequestMethod("POST");
//			connect.setRequestProperty("Authorization", "KakaoAK 99662baf45abdb7dbe84f9f361bcd131");
//			connect.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//			connect.setDoOutput(true);
//			
//			String parameter = "cid=TC0ONETIME";
//			parameter += "&partner_order_id=주문번호";  //주문번호
//			String item_name = URLEncoder.encode("상품이름","UTF-8");
//			parameter += "&partner_user_id=회원아이디"; //회원아이디
//			parameter += "&item_name="+item_name; //상품이름
//			parameter += "&quantity=1"; // 수량
//			parameter += "&total_amount=10000"; // 상품 총액
//			parameter += "&tax_free_amount=10000"; // 상품 비과세 금액
//			parameter += "&approval_url=http://localhost:8082/"; // 결제 성공시 url
//			parameter += "&cancel_url=http://localhost:8082/"; // 결제 취소시 url
//			parameter += "&fail_url=http://localhost:8082/"; // 결제 실패시 url
//			
//			OutputStream give = connect.getOutputStream();
//			DataOutputStream datagive = new DataOutputStream(give);
//			
//			datagive.writeBytes(parameter);
//			datagive.close();
//			
//			int result = connect.getResponseCode();
//			log.info("결과값 확인 : "+result);
//			
//			InputStream take;
//			
//			if(result == 200) {
//				take = connect.getInputStream();
//			}else {
//				take = connect.getErrorStream();
//			}
//			
//			log.info("결과값 take 확인 : "+take);
//			
//			InputStreamReader reader = new InputStreamReader(take);
//			BufferedReader buffer = new BufferedReader(reader);
//			
//			//log.info("결과값 take 확인 : "+buffer.readLine());
//			
//			return buffer.readLine();
//			
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		return "{\"result\":\"NO\"}";
//	}
//	
//	@RequestMapping("/kakaopaylist.cls")
//	@ResponseBody
//	public String kakaopaylist(String tid) {
//		
//		try {
//			URL addr = new URL("https://kapi.kakao.com/v1/payment/order");
//			HttpURLConnection connect = (HttpURLConnection) addr.openConnection();
//			connect.setRequestMethod("POST");
//			connect.setRequestProperty("Authorization", "KakaoAK 99662baf45abdb7dbe84f9f361bcd131");
//			connect.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//			connect.setDoOutput(true);
//			
//			String parameter = "cid=TC0ONETIME";
//			parameter += "&tid="+tid; // 
//			
//			OutputStream give = connect.getOutputStream();
//			DataOutputStream datagive = new DataOutputStream(give);
//			
//			datagive.writeBytes(parameter);
//			datagive.close();
//			
//			int result = connect.getResponseCode();
//			log.info("결과값 확인 : "+result);
//			
//			InputStream take;
//			
//			if(result == 200) {
//				take = connect.getInputStream();
//			}else {
//				take = connect.getErrorStream();
//			}
//			
//			log.info("결과값 take 확인 : "+take);
//			
//			InputStreamReader reader = new InputStreamReader(take);
//			BufferedReader buffer = new BufferedReader(reader);
//			
//			//log.info("결과값 take 확인 : "+buffer.readLine());
//			
//			return buffer.readLine();
//			
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		return "{\"result\":\"NO\"}";
//	}
}
