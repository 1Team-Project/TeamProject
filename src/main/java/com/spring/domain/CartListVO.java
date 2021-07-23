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

	private String p_name;
	private int p_price;

}
