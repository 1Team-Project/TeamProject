package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.spring.domain.CampusCriteria;
import com.spring.domain.CampusReplyVO;

public interface CampusReplyService {

	public CampusReplyVO read(int rno);

	public boolean insert(CampusReplyVO reply);
	
	public boolean update(CampusReplyVO reply);
	
	public boolean delete(int rno);
	
	public boolean deleteAll(int bno);
	
	public int getCountByBno(int b_no);
	
	public List<CampusReplyVO> list(int r_page, int b_no);
	
	
}
