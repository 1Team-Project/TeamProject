package com.spring.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class CartPaymentVO {

	//결제용
	private List<CartPaymentVO> cartVO;
	private String c_option;
	private String c_privateCode;
	
	//사진경로
	private String cartimg;
	private int p_shippingfee;
	
	private int c_cartnumber;
	private String u_userid;
	private int p_number;
	private String p_name;
	private int c_count;
	private int p_price;
	private int money;

}
