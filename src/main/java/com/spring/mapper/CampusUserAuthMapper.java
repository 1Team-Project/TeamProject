package com.spring.mapper;

import java.util.List;

import com.spring.domain.CampusAuthVO;
import com.spring.domain.CampusUserVO;

public interface CampusUserAuthMapper {
	
	public int insertAuth(String u_userid);

	public int leaveAuth(CampusUserVO vo);
	public int leaveCampAdmin(CampusUserVO vo);
	public List<CampusAuthVO> userAuth(CampusAuthVO auth);
	public CampusAuthVO userAuthOne(CampusAuthVO auth);
	public CampusAuthVO authModify(CampusAuthVO auth);
}