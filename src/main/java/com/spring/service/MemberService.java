package com.spring.service;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;

public interface MemberService {
	public boolean insert(MemberVO vo);
	public MemberVO dupId(String userid);
	public LoginVO login(String userid, String password);
	public boolean leave(String userid, String password);
	public boolean update(ChangeVO change);
}
