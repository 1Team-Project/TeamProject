package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.MemberVO;

public interface MemberMapper {
	public int insert(MemberVO vo);
	public MemberVO dupId(String userid);
	public LoginVO login(@Param("userid") String userid, @Param("password") String password);
	public int leave(@Param("userid") String userid, @Param("password") String password);
	public int update(ChangeVO change);
}
