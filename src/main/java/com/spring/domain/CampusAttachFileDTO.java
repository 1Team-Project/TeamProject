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

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int bno;
	
}
