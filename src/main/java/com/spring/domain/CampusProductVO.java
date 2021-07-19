package com.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CampusProductVO {
	private int p_number;
	private String p_name;
	private int p_price;
	private String p_option;
	private int p_stock;
	private String p_manufact;
	private String pc_code;
}