package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CampusCriteria {
	
	private int pageNum;
	private int amount;

	//검색 추가
	private String type;
	private String keyword;
	
	public CampusCriteria() {
		this(1,20);
	}
	
	public CampusCriteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		return type == null?new String[] {}:type.split("");
	}
}
