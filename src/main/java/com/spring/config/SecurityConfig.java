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
//		//모든 사람들이 접근할 수 있는 url 지정
//		//http.authorizeRequests().antMatchers("/login").permitAll();
//		
//		//한글 인코딩
//		CharacterEncodingFilter filter = new CharacterEncodingFilter();
//		filter.setEncoding("UTF-8");
//		filter.setForceEncoding(true);
//		http.addFilterBefore(filter, CsrfFilter.class);
//		
//		//접근 제한시 이동하는 핸들러
//		http.exceptionHandling
//		(exception -> exception.accessDeniedHandler(accessDeniedHandler()));
//		
//		//로그인 성공시
//		http.formLogin()
//		.loginPage("/member/login")
//		.loginProcessingUrl("/login")
//		.failureUrl("/member/login-error")
//		.successHandler(loginSuccessHandler());
//		
//		//로그아웃시
//		http.logout()
//		.invalidateHttpSession(true)
//		.logoutSuccessUrl("/");
//		
//		//리멤버
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
