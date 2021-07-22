package com.spring.domain;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.controller.HomeController;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CampusCampingjangVO {

	
	private int c_number;
	private int c_area;
	private Date c_sysdate;
	private Date c_rsysdate;
	private String c_name;
	private String c_content;
	
	
	
}
