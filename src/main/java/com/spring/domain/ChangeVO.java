package com.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChangeVO {
	private String u_userid;
	private String u_password;
	private String confirm_password;
	private String u_email;
	private String u_phone;
	private String u_address;
	
	public boolean newPasswordEqualsConfirmPassword() {
		return u_password.equals(this.confirm_password);
	}
}
