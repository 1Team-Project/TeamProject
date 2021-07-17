package com.spring.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.CampusUserVO;
import com.spring.mapper.CampusUserMapper;

@Service
public class CampusUserServiceImpl implements CampusUserService {

	@Autowired
	private CampusUserMapper mapper;
	
	@Override
	public boolean insert(CampusUserVO vo) {
		return mapper.insert(vo)>0? true:false;
	}

	@Override
	public CampusUserVO dupId(String u_userid) {
		return mapper.dupId(u_userid);
	}

	@Override
	public CampusUserVO login(String u_userid, String u_password) {
		return mapper.login(u_userid, u_password);
	}


	@Override
	public boolean leave(String u_userid, String u_password) {
		return mapper.leave(u_userid, u_password)>0? true:false;
	}

	@Override
	public boolean update(ChangeVO change) {
		return mapper.update(change)>0? true:false;
	}

	@Override
	public boolean userUpdate(CampusUserVO vo) {
		return mapper.userUpdate(vo)>0? true:false;
	}

}
