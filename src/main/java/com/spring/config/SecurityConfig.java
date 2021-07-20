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

import com.spring.handler.CustomAccessDeniedHandler;
import com.spring.handler.CustomLoginSuccessHandler;
import com.spring.service.CustomUserDetailService;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	// security-context.xml
	
	@Autowired
	private DataSource dataSource;
	
	// <bean id="customLoginSuccessHandler" class="com.spring.handler.CustomLoginSuccessHandler" />
	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}
	
	// <bean id="customAccessDeniedHandler" class="com.spring.handler.CustomAccessDeniedHandler" />
	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}
	
	/*
	<!-- 암호화 -->
	<bean id="bCryptPasswordEncoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"/>
	*/
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	/*
	<security:authentication-manager>
		<security:authentication-provider user-service-ref="customUserDetailService">
			<!-- jdbc 인증 방식 -->
			<security:password-encoder ref="bCryptPasswordEncoder"/>
		</security:authentication-provider>
	</security:authentication-manager>
	*/
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	/*
	<!-- UserDetailService -->
	<bean id="customUserDetailService" class="com.spring.service.CustomUserDetailService"/>
	*/
	@Bean
	public UserDetailsService customUserDetailService() {
		return new CustomUserDetailService();
	}
	
	// <security:http>
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 모든 사람이 접근할 수 있는 url 지정
		http.authorizeRequests()
			.antMatchers("/login").permitAll()
			.antMatchers("/board/viewadd").permitAll()
			.antMatchers("/UserPage").access("hasRole('ROLE_USER', 'ROLE_ADMIN')")
			.antMatchers("/AdminPage").access("hasRole('ROLE_ADMIN')");
		
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("utf-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
		
		/*
		<!-- 접근 제한 시 handler를 거쳐 컨트롤러로 이동하는 형태 -->
		<security:access-denied-handler ref="customAccessDeniedHandler"/>
		 */
		http.exceptionHandling(exception -> exception.accessDeniedHandler(accessDeniedHandler()));

		/*
		<!-- 로그인 담당 : 기본 필터 -->
		<security:form-login login-page="/login" authentication-failure-url="/login-error" 
		authentication-success-handler-ref="customLoginSuccessHandler"/>
		 */
		http.formLogin()
			.loginPage("/login")
			.loginProcessingUrl("/loginForm")
			.usernameParameter("u_userid")
			.passwordParameter("u_password")
			.successHandler(loginSuccessHandler())
			.failureUrl("/login-error");
		
		/*
		<!-- 로그 아웃 담당 -->
		<security:logout invalidate-session="true" logout-success-url="/"/>
		*/
		http.logout()
			.invalidateHttpSession(true)
			.logoutSuccessUrl("/");
		/*
		<!-- remember-me 활성화 -->
		<security:remember-me data-source-ref="ds" token-validity-seconds="604800"/>
		*/
		http.rememberMe()
			.tokenRepository(persistentTokenRepository())
			.tokenValiditySeconds(604800);
	}
	
	/*
	<!-- UserDetailService -->
	<bean id="customUserDetailService" class="com.spring.service.CustomUserDetailService"/>
	*/
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailService())
			.passwordEncoder(passwordEncoder());
	}
	
}