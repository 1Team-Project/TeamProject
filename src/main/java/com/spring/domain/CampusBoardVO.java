package com.spring.domain;

import java.util.Date;
import java.util.List;

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

public class CampusBoardVO {
	
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_writer;
	private Date b_sysdate;
	private int replycnt;
	
	private int b_views;
	private String b_sort;
	private int b_rating;
	private int p_pnumber;
	
	//첨부파일
	private List<CampusAttachFileDTO> attachList;
}
