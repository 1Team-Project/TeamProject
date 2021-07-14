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
	public int d_number;
	public int p_number;
	public int o_number;
	public int d_count;
	public int d_price;
	
}
