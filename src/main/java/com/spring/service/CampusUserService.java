package com.spring.service;

import java.util.List;

import com.spring.domain.CampusAuthVO;
import com.spring.domain.CampusUserVO;

public interface CampusUserService {
	public boolean insert(CampusUserVO vo);
	public CampusUserVO dupId(String u_userid);
	public CampusUserVO login(CampusUserVO vo);
	public boolean leaveAuth(CampusUserVO vo);
	public boolean leaveCamp(CampusUserVO vo);
	public boolean update(CampusUserVO vo);
	public boolean userUpdate(CampusUserVO vo);
	
	public int pwdCheck(CampusUserVO vo);
	
	public List<CampusUserVO> userList(CampusUserVO vo);
	public List<CampusAuthVO> userAuth(CampusAuthVO auth);
}