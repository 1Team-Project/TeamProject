package com.spring.domain;

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

public class CartListVO {
	private int c_cartnumber;
	private String u_userid;
	private int p_number;
	private int c_count;
	private String c_option;
	
	private String p_name;
	private String p_manufact;
	private int p_price;
	
	//상품사진
	private String a_uuid;
	private String a_path;
	private String a_name;
	private String urllink;
	private String path;
	private String thumbimg;

}
