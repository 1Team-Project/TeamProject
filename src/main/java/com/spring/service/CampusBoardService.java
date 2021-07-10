package com.spring.service;

import java.util.List;

import com.spring.domain.CampusAttachFileDTO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;

public interface CampusBoardService {

	public boolean insert(CampusBoardVO vo);
	public boolean delete(int bno);
	public boolean update(CampusBoardVO vo);
	public List<CampusBoardVO> list(CampusCriteria cri);	
	public CampusBoardVO read(int bno);
	public int total(CampusCriteria cri);
	
	public List<CampusAttachFileDTO> getAttachList(int bno);
}
