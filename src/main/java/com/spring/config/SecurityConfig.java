package com.spring.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

//import com.spring.handler.CustomAccessDeniedHandler;
//import com.spring.handler.CustomLoginSuccessHandler;
//import com.spring.service.CustomUserDetailService;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
//	
//	@Autowired
//	private DataSource dataSource;
//	
//	@Bean
//	public AuthenticationSuccessHandler loginSuccessHandler() {
//		return new CustomLoginSuccessHandler();
//	}
//	
//	@Bean
//	public AccessDeniedHandler accessDeniedHandler() {
//		return new CustomAccessDeniedHandler();
//	}
//	
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//	
//	@Bean
//	public PersistentTokenRepository persistentTokenRepository() {
//		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
//		repo.setDataSource(dataSource);
//		return repo;
//	}
//	
//	@Bean
//	public UserDetailsService customUserDetailService() {
//		return new CustomUserDetailService();
//	}
//	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		//��� ������� ������ �� �ִ� url ����
//		//http.authorizeRequests().antMatchers("/login").permitAll();
//		
//		//�ѱ� ���ڵ�
//		CharacterEncodingFilter filter = new CharacterEncodingFilter();
//		filter.setEncoding("UTF-8");
//		filter.setForceEncoding(true);
//		http.addFilterBefore(filter, CsrfFilter.class);
//		
//		//���� ���ѽ� �̵��ϴ� �ڵ鷯
//		http.exceptionHandling
//		(exception -> exception.accessDeniedHandler(accessDeniedHandler()));
//		
//		//�α��� ������
//		http.formLogin()
//		.loginPage("/member/login")
//		.loginProcessingUrl("/login")
//		.failureUrl("/member/login-error")
//		.successHandler(loginSuccessHandler());
//		
//		//�α׾ƿ���
//		http.logout()
//		.invalidateHttpSession(true)
//		.logoutSuccessUrl("/");
//		
//		//�����
//		http.rememberMe()
//		.tokenRepository(persistentTokenRepository())
//		.tokenValiditySeconds(604800);
//		
//	}
//	
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//
//		auth.userDetailsService(customUserDetailService())
//		.passwordEncoder(passwordEncoder());
//	}
	
}
