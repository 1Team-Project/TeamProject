package com.spring.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusPageVO;
import com.spring.domain.CampusProductCategoryVO;
import com.spring.domain.CampusProductOptionVO;
import com.spring.domain.CampusProductVO;

public interface CampusProductMapper {

	public List<CampusProductVO> prolist(CampusCriteria cri);
	public List<CampusProductVO> bestlist();
	public List<CampusProductVO> catelist(CampusCriteria cri,@Param("pc_code") String pc_code);
	public CampusProductVO viewProduct(@Param("p_number") int p_number);
	public int totalPro(CampusCriteria cri);
	
	//카테고리뿌리기용
	public  List<CampusProductCategoryVO> category(CampusCriteria cri);
	//옵션뿌리기용
	public List<CampusProductOptionVO> optionlist(String op_optiontitle);
	
	//관리자용
	public int insertProduct(CampusProductVO vo);
	public int deleteProduct(int p_number);
	public int updateProduct(@Param("p_price") int p_price,@Param("p_stock") int p_stock,@Param("p_number") int p_number);
	public CampusProductVO productdetail(int p_number);
	

}
