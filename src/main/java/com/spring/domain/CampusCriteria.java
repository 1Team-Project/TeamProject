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
	//상품조회에서 쓰는거
	//private String cri;
	
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
