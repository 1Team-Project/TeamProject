package com.spring.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {
	private int b_no;
	private String b_title;
	private String b_writer;
	private int b_views;
	private String b_content;
	private String b_sort;
	private int b_rating;
	private Date b_sysdate;
	private int p_number;
}
