package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.ChangeVO;
import com.spring.domain.CampusAuthVO;
import com.spring.domain.CampusBoardVO;
import com.spring.domain.CampusCriteria;
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
	public boolean leaveAuth(CampusUserVO vo) {
		return authmapper.leaveAuth(vo)>0? true:false;
	}
	
	@Override
	public boolean leaveCamp(CampusUserVO vo) {
		return mapper.leaveCamp(vo)>0? true:false;
	}
	
	@Override
	public int pwdCheck(CampusUserVO vo) {
		return mapper.pwdCheck(vo);
	}
	
	@Override
	public boolean update(CampusUserVO vo) {
		return mapper.update(vo)>0? true:false;
	}

	@Override
	public boolean userUpdate(CampusUserVO vo) {
		return mapper.userUpdate(vo)>0? true:false;
	}

	@Override
	public List<CampusUserVO> userList(CampusUserVO vo) {
		return mapper.userList(vo);
	}

	@Override
	public List<CampusAuthVO> userAuth(CampusAuthVO auth) {
		return authmapper.userAuth(auth);
	}

	@Override
	public CampusUserVO read(CampusUserVO vo) {
		return mapper.read(vo.getU_userid());
	}

	@Override
	public CampusAuthVO userAuthOne(CampusAuthVO auth) {
		return authmapper.userAuthOne(auth);
	}

	@Override
	public boolean leaveCampAdmin(CampusUserVO vo) {
		return authmapper.leaveCampAdmin(vo)>0? true:false;
	}

	@Override
	public CampusAuthVO authModify(CampusAuthVO auth) {
		return authmapper.authModify(auth);
	}

	@Override
	public CampusUserVO findId(CampusUserVO vo) {
		return mapper.findId(vo);
	}

	@Override
	public CampusUserVO findPw(CampusUserVO vo) {
		return mapper.findPw(vo);
	}

	@Override
	public int updatePw(CampusUserVO vo) {
		return mapper.updatePw(vo);
	}

	
}