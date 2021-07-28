package com.spring.mapper;

import java.util.List;

import com.spring.domain.CampusAuthVO;
import com.spring.domain.CampusUserVO;

public interface CampusUserMapper {
	public int insert(CampusUserVO vo);
	public CampusUserVO dupId(String u_userid);
	public CampusUserVO login(CampusUserVO vo);
	public int leaveAuth(CampusUserVO vo);
	public int leaveCamp(CampusUserVO vo);
	public int leaveCampAdmin(CampusUserVO vo);
	public int update(CampusUserVO vo);
	public int userUpdate(CampusUserVO vo);
	public CampusUserVO read(String u_userid);
	
	public List<CampusUserVO> userList(CampusUserVO vo);
	public List<CampusAuthVO> userAuth(CampusAuthVO auth);
	public CampusAuthVO userAuthOne(CampusAuthVO auth);
	
	public int pwdCheck(CampusUserVO vo);
	
}