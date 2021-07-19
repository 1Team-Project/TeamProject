package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.domain.CartVO;
import com.spring.mapper.CartMapper;

public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;
	
	@Override
	public boolean addCart(CartVO vo) {
		return mapper.addCart(vo) > 0 ? true:false;
		
	}

}
