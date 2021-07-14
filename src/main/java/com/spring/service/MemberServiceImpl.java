package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public boolean insert(MemberVO vo) {
		return mapper.insert(vo)>0? true:false;
	}

	@Override
	public MemberVO dupId(String u_userid) {
		return mapper.dupId(u_userid);
	}

	@Override
	public LoginVO login(String u_userid, String u_password) {
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

}
