package com.spring.service;

import java.util.List;

import com.spring.domain.CampusCampingVO;

public interface CampusCampingService {
	public List<CampusCampingVO> campinglist();
	public CampusCampingVO campingArea(int c_number);
	public boolean reserveCamp(int c_number, String u_userid);
	public boolean cancelCamp(String u_userid, int c_number);
}
