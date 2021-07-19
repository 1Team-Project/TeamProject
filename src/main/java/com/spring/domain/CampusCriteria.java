package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CampusCriteria {
	
	private int page;

	//검색 추가
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
