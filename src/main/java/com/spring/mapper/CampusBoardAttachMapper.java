package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CampusAttachFileDTO;

public interface CampusBoardAttachMapper {
	
	public int insert(CampusAttachFileDTO attach);
	
	public int insert_p(@Param("a_uuid")String a_uuid, @Param("a_path")String a_path, @Param("a_name")String a_name, @Param("a_type")int a_type, @Param("b_no")int b_no, @Param("p_number")int p_number);
	
	public int delete(int b_no);
	
	public List<CampusAttachFileDTO> findByBno(int b_no);

	public List<CampusAttachFileDTO> getOldFiles();
	
	public List<CampusAttachFileDTO> getImg();
}
