package com.spring.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.CampusUserVO;
import com.spring.mapper.CampusUserAuthMapper;
import com.spring.mapper.CampusUserMapper;

@Service
public class CampusUserServiceImpl implements CampusUserService {

	@Autowired
	private CampusUserMapper mapper;
	
	@Autowired
	private CampusUserAuthMapper authmapper;
	
	@Override
	@Transactional
	public boolean insert(CampusUserVO vo) {
		boolean result = false;
		if(mapper.insert(vo)>0) {
			result = authmapper.insertAuth(vo.getU_userid())>0?true:false;
		}
		return result;
	}

	@Override
	public CampusUserVO dupId(String u_userid) {
		return mapper.dupId(u_userid);
	}

	@Override
	public CampusUserVO login(CampusUserVO vo) {
		return mapper.login(vo);
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
