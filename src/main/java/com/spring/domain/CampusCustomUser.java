package com.spring.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CampusCustomUser extends User {

	private CampusUserVO campusUser;
	
	public CampusCustomUser(String u_userid, String u_password, Collection<? extends GrantedAuthority> authorities) {
		super(u_userid, u_password, authorities);

	} 
	
	public CampusCustomUser(CampusUserVO campusUser) {
		super(campusUser.getU_userid(), campusUser.getU_password(), 
				campusUser.getAuthList()
				.stream()
				.map(u_auth -> new SimpleGrantedAuthority(u_auth.getU_auth())).collect(Collectors.toList()));
		this.campusUser = campusUser;
	}

}
