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

public class CampusProductOptionVO {

	private int p_number;
	private String po_optiontitle;
	private String po_option1;
	private String po_option2;
	private String po_option3;
	
}
