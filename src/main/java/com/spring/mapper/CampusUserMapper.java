package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.ChangeVO;
import com.spring.domain.LoginVO;
import com.spring.domain.CampusUserVO;

public interface CampusUserMapper {
	public int insert(CampusUserVO vo);
	public CampusUserVO dupId(String u_userid);
	public CampusUserVO login(CampusUserVO vo);
	public int leave(@Param("u_userid") String u_userid, @Param("u_password") String u_password);
	public int update(ChangeVO change);
	public int userUpdate(CampusUserVO vo);
	public CampusUserVO read(String u_userid);
}