package com.spring.config;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;
import oracle.ucp.jdbc.PoolDataSourceImpl;

@EnableAspectJAutoProxy // aop
@EnableTransactionManagement // tx
@MapperScan("com.spring.mapper")
@ComponentScan("com.spring.service")
@Configuration
public class RootConfig {

	
	@Bean
	public DataSource dataSource() throws SQLException {		
		
		
		PoolDataSource pool  = PoolDataSourceFactory.getPoolDataSource();
		
//		PoolDataSourceImpl pool = new PoolDataSourceImpl();	
		
		pool.setConnectionFactoryClassName("oracle.jdbc.pool.OracleDataSource");
		pool.setURL("jdbc:oracle:thin:@campus_medium?TNS_ADMIN=C://Wallet_CampUs");
		pool.setUser("ADMIN");
		pool.setPassword("CampUs1234team1");
		pool.setMaxPoolSize(20);
		pool.setInitialPoolSize(5);
		
		return pool;
		
//		HikariConfig hikariConfig = new HikariConfig();
//		hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");
//		hikariConfig.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
//		hikariConfig.setUsername("javadb");
//		hikariConfig.setPassword("12345");
//		
//		HikariDataSource datasource = new HikariDataSource(hikariConfig);
//		return datasource;
	}
	
	//mybatis
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());
		return sqlSessionFactoryBean.getObject();
	}
	
	//transaction
	@Bean
	public DataSourceTransactionManager txManager() throws SQLException {
		return new DataSourceTransactionManager(dataSource());
	}
}
