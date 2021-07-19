package com.spring.mapper;

import com.spring.domain.CampusProductOptionVO;

public interface OptionMapper {

	public int insertProductOption(CampusProductOptionVO vo);
	public int deleteProductOption(int p_number);
	
}