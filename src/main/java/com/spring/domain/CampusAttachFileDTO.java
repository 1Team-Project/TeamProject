package com.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class CampusAttachFileDTO {

	private String a_uuid;
	private String a_path;
	private String a_name;
	private boolean a_type;
	private int b_no;
	
}
