package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.domain.CampusCampingVO;
import com.spring.mapper.CampusCampingMapper;

public class CampusCampingServiceImpl implements CampusCampingService {
	@Autowired
	CampusCampingMapper mapper;
	
	@Override
	public List<CampusCampingVO> campinglist() {
		return mapper.campinglist();
	}

	@Override
	public CampusCampingVO campingArea(int c_number) {
		return mapper.campingArea(c_number);
	}

	@Override
	public boolean reserveCamp(int c_number, String u_userid) {
		return mapper.reserveCamp(c_number, u_userid)>0?true:false;
	}

	@Override
	public boolean cancelCamp(String u_userid, int c_number) {
		return mapper.cancelCamp(u_userid, c_number)>0?true:false;
	}

}
