package com.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter

public class CampusBoardTopVO {
	
	private int b_no;
	private String b_title_10;
	private String b_content_15;
	private int rank;
	private String urllink;
	
}
