package com.spring.mapper;

import java.util.List;

import com.spring.domain.CampusAttachFileDTO;

public interface CampusBoardAttachMapper {
	
	public int insert(CampusAttachFileDTO attach);
	
	public int delete(int b_no);
	
	public List<CampusAttachFileDTO> findByBno(int b_no);

	public List<CampusAttachFileDTO> getOldFiles();
	
	public List<CampusAttachFileDTO> getImg();
}
