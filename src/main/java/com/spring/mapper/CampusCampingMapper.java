package com.spring.mapper;

import java.util.List;

import com.spring.domain.CampusCampingVO;

public interface CampusCampingMapper {
	public List<CampusCampingVO> campinglist();
	public CampusCampingVO campingArea(int c_number);
	public int reserveCamp(int c_number, String u_userid);
	public int cancelCamp(String u_userid, int c_number);
	
}
