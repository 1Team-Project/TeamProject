package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CartVO;
import com.spring.mapper.CartMapper;

@Service
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
	public int sum(String u_userid) {
		// TODO Auto-generated method stub
		return mapper.sum(u_userid);
	}

	@Override
	public List<CartVO> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteAll(String u_userid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int countCart(String u_userid, int p_number) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void update(int c_cartnumber) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean updateCart(CartVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

}
