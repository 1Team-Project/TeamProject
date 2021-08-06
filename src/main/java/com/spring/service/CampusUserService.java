package com.spring.service;

import java.util.List;

import com.spring.domain.CampusAuthVO;
import com.spring.domain.CampusUserVO;

public interface CampusUserService {
	public boolean insert(CampusUserVO vo);
	public CampusUserVO dupId(String u_userid);
	public CampusUserVO findId(CampusUserVO vo);
	public CampusUserVO findPw(CampusUserVO vo);
	public CampusUserVO login(CampusUserVO vo);
	public boolean leaveAuth(CampusUserVO vo);
	public boolean leaveCamp(CampusUserVO vo);
	public boolean leaveCampAdmin(CampusUserVO vo);
	public boolean update(CampusUserVO vo);
	public int updatePw(CampusUserVO vo);
	public boolean userUpdate(CampusUserVO vo);
	
	public int pwdCheck(CampusUserVO vo);
	
	public CampusUserVO read(CampusUserVO vo);
	public List<CampusUserVO> userList(CampusUserVO vo);
	public List<CampusAuthVO> userAuth(CampusAuthVO auth);
	public CampusAuthVO userAuthOne(CampusAuthVO auth);
	public CampusAuthVO authModify(CampusAuthVO auth);
}