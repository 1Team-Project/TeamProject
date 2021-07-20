package com.spring.service;

import java.util.List;

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

	@Override
	public List<CartVO> listCart(String u_userid) {
		// TODO Auto-generated method stub
		return mapper.listCart(u_userid);
	}

	@Override
	public boolean delete(int c_cartnumber) {
		// TODO Auto-generated method stub
		return mapper.delete(c_cartnumber)>0? true:false;
	}

	@Override
	public boolean modifyCart(CartVO vo) {
		// TODO Auto-generated method stub
		return mapper.modifyCart(vo) > 0 ? true:false;
	}

	@Override
	public boolean sum(String u_userid) {
		// TODO Auto-generated method stub
		return mapper.sum(u_userid) > 0 ? true: false;
	}

}
