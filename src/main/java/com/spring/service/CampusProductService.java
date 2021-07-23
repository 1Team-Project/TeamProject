package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusProductCategoryVO;
import com.spring.domain.CampusProductOptionVO;
import com.spring.domain.CampusProductVO;

public interface CampusProductService {

	public List<CampusProductVO> prolist(CampusCriteria cri);
	public List<CampusProductVO> bestlist();
	public List<CampusProductVO> catelist(CampusCriteria cri,String pc_code);
	
	public CampusProductVO viewProduct(int p_number);
	public int total(CampusCriteria cri);
	
	public List<CampusAttachFileDTO> getImg();

	
	public boolean insertProduct(CampusProductVO vo, CampusProductOptionVO voo, CampusBoardVO vob);
	public boolean deleteProduct(int p_number, int b_no);
	public boolean updateProduct(int p_price, int p_stock, int p_number);
	
	public CampusProductVO detailproduct(int p_number);
	
	//카테고리목록뿌리기
	public  List<CampusProductCategoryVO> category(CampusCriteria cri);
	//옵션목록뿌리기
	public List<CampusProductOptionVO> optionlist(String op_optiontitle);
	
	
	public List<CampusAttachFileDTO> getAttachList(int p_number);
}