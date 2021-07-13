package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;

public interface MemberMapper {
	public int insert(MemberVO vo);
	public MemberVO dupId(String u_userid);
	public LoginVO login(@Param("u_userid") String u_userid, @Param("u_password") String u_password);
	public int leave(@Param("u_userid") String u_userid, @Param("u_password") String u_password);
	public int update(ChangeVO change);
}
