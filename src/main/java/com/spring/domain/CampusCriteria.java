package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CampusCriteria {
	
	private int page;

	//페이지 나누기
	private String sort;
	private String keyword;
	
	public CampusCriteria() {
		this(1);
	}
	
	public CampusCriteria(int page) {
		super();
		this.page = page;
	}

	public String[] getSortArr() {
		return sort == null?new String[] {}:sort.split("");
	}
}
