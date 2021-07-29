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
	public List<CampusProductVO> catelist(@Param("cri")CampusCriteria cri,@Param("pc_code") String pc_code);
	public CampusProductVO viewProduct(@Param("p_number") int p_number);
	//상품 상세 읽기
	public CampusBoardVO viewProductcontent(@Param("p_number") int p_number);
	//상품 상세 페이지 내 후기
	public List<CampusBoardVO> selectReview(@Param("p_number") int p_number);
	//상품 상세 내 질문
	public List<CampusBoardVO> selectq(@Param("p_number") int p_number);
	
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