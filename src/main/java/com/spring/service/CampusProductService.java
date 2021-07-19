package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusProductVO;

public interface CampusProductService {

	public List<CampusProductVO> prolist();
	public List<CampusProductVO> bestlist();
	public List<CampusProductVO> productCategory(String pc_code);
	public List<CampusProductVO> searchProduct(String p_name);
	
	public CampusProductVO viewProduct(int p_number);
	
	public int insertProduct(CampusProductVO vo);
	public int deleteProduct(int p_number);
	public int updateProduct(@Param("p_price") int p_price,@Param("p_stock") int p_stock,@Param("p_number") int p_number);
}
