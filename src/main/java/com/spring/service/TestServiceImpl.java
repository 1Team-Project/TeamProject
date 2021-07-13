package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.Test;

@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	private Test mapper;

	@Override
	public void testSelect() {
		mapper.test();
		
	}

}
