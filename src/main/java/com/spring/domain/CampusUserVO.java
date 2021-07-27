package com.spring.domain;

import java.util.List;

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
public class CampusUserVO {
	
	private List<CampusUserVO> campusUserVO;
	
	private String u_userid;
	private String u_password;
	private String u_username;
	private String u_email;
	private String u_phone;
	private String u_address;
	
	private List<CampusAuthVO> authList;
}
