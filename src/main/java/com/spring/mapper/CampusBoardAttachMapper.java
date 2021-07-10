package com.spring.mapper;

import java.util.List;

import com.spring.domain.CampusAttachFileDTO;

public interface CampusBoardAttachMapper {
	
	public int insert(CampusAttachFileDTO attach);
	
	public int delete(int bno);
	
	public List<CampusAttachFileDTO> findByBno(int bno);

	public List<CampusAttachFileDTO> getOldFiles();
}
