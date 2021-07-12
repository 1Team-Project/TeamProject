package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;

public interface CampusBoardMapper {

	public int insert(CampusBoardVO vo);
	
	public int delete(int bno);
	
	public int update(CampusBoardVO vo);
	
	public List<CampusBoardVO> list(CampusCriteria cri);	
	
	public CampusBoardVO view(int bno);

	public int totalCnt(CampusCriteria cri);
	
	public int replyCntUpdate(@Param("bno") int bno);
}
