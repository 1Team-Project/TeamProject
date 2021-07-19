package com.spring.service;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.CampusUserVO;

public interface CampusUserService {
	public boolean insert(CampusUserVO vo);
	public CampusUserVO dupId(String u_userid);
	public CampusUserVO login(CampusUserVO vo);
	public boolean leave(String u_userid, String u_password);
	public boolean update(ChangeVO change);
	public boolean userUpdate(CampusUserVO vo);
}
