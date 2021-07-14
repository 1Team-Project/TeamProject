package com.spring.service;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;

public interface MemberService {
	public boolean insert(MemberVO vo);
	public MemberVO dupId(String u_userid);
	public LoginVO login(String u_userid, String u_password);
	public boolean leave(String u_userid, String u_password);
	public boolean update(ChangeVO change);
}
