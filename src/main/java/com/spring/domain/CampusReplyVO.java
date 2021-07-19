package com.spring.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CampusReplyVO {

	private int b_no;
	private int r_no;
	private String r_content;
	private String r_replyer;
	private Date r_sysdate;
	
}
