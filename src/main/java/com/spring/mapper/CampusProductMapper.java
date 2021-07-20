package com.spring.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
import com.spring.domain.CampusProductVO;

public interface CampusProductMapper {

	public List<CampusProductVO> prolist(CampusCriteria cri);
	public List<CampusProductVO> bestlist();
	public List<CampusProductVO> catelist(String pc_code);
	public List<CampusProductVO> searchProduct(String p_name);
	public CampusProductVO viewProduct(@Param("p_number") int p_number);
	public int totalPro(CampusCriteria cri);
	

}


