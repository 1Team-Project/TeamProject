package com.spring.mapper;

import java.util.List;

import com.spring.domain.CampusProductCategoryVO;

public interface CategoryMapper {
	
	//카테고리 뿌리기용
	public  List<CampusProductCategoryVO> category();
}
