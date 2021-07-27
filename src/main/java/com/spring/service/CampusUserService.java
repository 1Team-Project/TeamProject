package com.spring.service;

import com.spring.domain.ChangeVO;
import com.spring.domain.CampusUserVO;

public interface CampusUserService {
	public boolean insert(CampusUserVO vo);
	public CampusUserVO dupId(String u_userid);
	public CampusUserVO login(CampusUserVO vo);
	public boolean leaveAuth(CampusUserVO vo);
	public boolean leaveCamp(CampusUserVO vo);
	public boolean update(ChangeVO change);
	public boolean userUpdate(CampusUserVO vo);
	
	public int pwdCheck(CampusUserVO vo);
}