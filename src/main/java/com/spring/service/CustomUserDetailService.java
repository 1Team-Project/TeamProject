package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.spring.domain.CampusCustomUser;
import com.spring.domain.CampusUserVO;
import com.spring.mapper.CampusUserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomUserDetailService implements UserDetailsService {
	
	@Autowired
	private CampusUserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// username => userid 값
		log.info("u_userid : " + username);
		
		CampusUserVO CampusUser = mapper.read(username);
		
		log.info("인증정보 " + CampusUser);
		
		return new CampusCustomUser(CampusUser);
	}

}