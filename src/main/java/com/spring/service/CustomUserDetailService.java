package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.domain.CampusCustomUser;
import com.spring.domain.CampusUserVO;
import com.spring.mapper.CampusUserMapper;

import lombok.extern.log4j.Log4j2;


@Log4j2
public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	private CampusUserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String u_userid) throws UsernameNotFoundException {
		// username => userid 값
		log.info("u_userid : " + u_userid);
		
		CampusUserVO CampusUser = mapper.read(u_userid);
		
		log.info("인증정보 " + CampusUser);
		
		return new CampusCustomUser(CampusUser);
	}

}