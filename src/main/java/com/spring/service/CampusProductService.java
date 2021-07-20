package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusProductOptionVO;
import com.spring.domain.CampusProductVO;

public interface CampusProductService {

	public List<CampusProductVO> prolist(CampusCriteria cri);
	public List<CampusProductVO> bestlist();
	public List<CampusProductVO> catelist(String pc_code);
	public List<CampusProductVO> searchProduct(String p_name);
	
	public CampusProductVO viewProduct(int p_number);
	public int total(CampusCriteria cri);
	
	

	
	public boolean insertProduct(CampusProductVO vo, CampusProductOptionVO voo, CampusBoardVO vob);
	public boolean deleteProduct(int p_number, int b_no);
	public boolean updateProduct(int p_price, int p_stock, int p_number);
	
	public CampusProductVO detailproduct(int p_number);
}