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

public class OrderDetailVO {
	private int d_number;
	private int p_number;
	private int o_number;
	private int d_count;
	private int d_price;
	
}
