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
	private int p_number;
	
	private String p_name;
	private int rownum;
	
	//첨부파일 리스트
	private List<CampusAttachFileDTO> attachList;
	
	//상품사진
	private String a_uuid;
	private String a_path;
	private String a_name;
	private String urllink;
	private String path;
	private String thumbimg;
}