package com.spring.service;

import java.util.List;

import com.spring.domain.CampusProductVO;

public interface CampusProductService {

	public List<CampusProductVO> productList();
	public List<CampusProductVO> productCategory(String pc_code);
	public List<CampusProductVO> searchProduct(String p_name);
	
	public boolean insertProduct(CampusProductVO vo);
	public boolean deleteProduct(int p_number);
	public boolean updateProduct(int p_price, int p_stock);
}
