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
public class CartVO {
	
	private int c_cartnumber;
	private String u_userid;
	private int p_number;
//	private String p_name;
	private int c_count;
	private String c_option;
	
//	private int price;
//	private int money;
	
	
	
}