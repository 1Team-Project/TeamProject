  
package com.spring.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusBoardCheckOrderVO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusProductVO;

public interface CampusBoardMapper {

	public int insert(CampusBoardVO vo);
	
	public int insert_p(CampusBoardVO vo);
	
	public int delete(int bno);

	public int delete_p(int p_number);
	
	public String productfindboard(int p_number);
	
	public int productinsertboard(@Param("b_no")int b_no, @Param("p_name")String p_name);
	
	public CampusBoardVO selectpnumber(int p_number);
	
	public List<CampusBoardVO> topdate();
	
	public int update(CampusBoardVO vo);
	
	public List<CampusBoardVO> list(CampusCriteria cri);
	
	public List<CampusBoardVO> listReview(CampusCriteria cri);
	public List<CampusBoardVO> listQNA(CampusCriteria cri);
	
	public List<CampusBoardCheckOrderVO> orderCheck(String u_userid);
	
	public CampusBoardVO view(int bno);

	public int totalCnt(CampusCriteria cri);
	
	public int replyCntUpdate(@Param("b_no")int bno, @Param("replycnt")int replycnt);
	
	public int addview(@Param("b_views")int views, @Param("b_no")int bno);
	
	public int totalReview(CampusCriteria cri);
	
	public int totalQNA(CampusCriteria cri);
	
	public List<CampusProductVO> oneCheck(String checkId);
	
	
	
	// 영권 main 게시판 10개 보기용 추가
	public List<CampusBoardVO> mainList(CampusCriteria cri);
	
	
	
}