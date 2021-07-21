package com.spring.controller;

import java.util.Date;
import java.util.List;

import com.spring.domain.CampusAttachFileDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CampController {

	
	private int c_number;
	private int c_area;
	private Date c_sysdate;
	private Date c_rsysdate;
	private String c_name;
	private String c_content;
	
}
