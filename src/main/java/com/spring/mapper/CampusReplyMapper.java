package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusReplyVO;

public interface CampusReplyMapper {

	public int insert(CampusReplyVO reply);
	
	public CampusReplyVO read(int rno);
	
	public int update(CampusReplyVO reply);
	
	public int delete(int rno);
	
	//´ñ±Û
	public int deleteAll(int bno);
	
	
	public int getCountByBno(int bno);
	
	public List<CampusReplyVO> list(@Param("cri")CampusCriteria cri,@Param("bno")int bno);
}
