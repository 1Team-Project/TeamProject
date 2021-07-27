package com.spring.domain;

import java.util.List;

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
	
	private List<CampusProductVO> campusProductVO;
	private String po_option_vo;
	
	
	private int p_number;
	private String p_name;
	private int p_price;
	private String p_option;
	private int p_stock;
	private String pc_code;
	private String p_manufact;
	private int p_rank;
	private int p_shippingfee;

	//상품사진
	private String a_uuid;
	private String a_path;
	private String a_name;
	private String urllink;

	private String path;

	private String thumbimg;
	
	//첨부파일 리스트
		private List<CampusAttachFileDTO> attachList;
}


