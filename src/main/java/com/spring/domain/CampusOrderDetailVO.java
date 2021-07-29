package com.spring.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CampusOrderDetailVO {
	
	private int d_number;
	private int p_number;
	private int o_number;
	private int d_count;
	private int d_price;

	private int c_cartnumber;
	
	private String d_option;

	
}