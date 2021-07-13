package com.spring.mapper;

import org.apache.ibatis.annotations.Select;

import com.spring.domain.CategoryVO;

public interface Test {
	
	@Select("select * from CAMPUS_PRODUCT_CATEGORY")
	public CategoryVO test();
}
