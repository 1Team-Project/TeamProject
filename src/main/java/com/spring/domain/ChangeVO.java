package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChangeVO {
	private String userid;
	private String current_password;
	private String new_password;
	private String confirm_password;
	
	public boolean newPasswordEqualsConfirmPassword() {
		return new_password.equals(this.confirm_password);
	}
}
